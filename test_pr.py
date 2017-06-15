#!/usr/bin/python

##
## Imports
##

import base64
from getpass import getpass
import hashlib
import json
import os
import re
import sys

##
## Conditional Imports
##

def crypto_fail():
	print('Error.\nIt seems your python installation does not include a necessary ' +
		'cryptographic library. Run "pip install pycryptodomex" to fix this.')
	sys.exit(1)

def is_python_2():
	return sys.version_info[0] == 2

try:
	from Cryptodome.Cipher import AES
except ImportError as ie:
	try:
		from Crypto.Cipher import AES
	except ImportError as ie2:
		crypto_fail()

if is_python_2():
	import urllib2 as compat_urllib
else:
	import urllib.request as compat_urllib

##
## Constants
##

BLOCK_SIZE = 16

CREDENTIAL_DIRNAME = '.credentials'

JENKINS_CRUMB_API = 'crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'
JENKINS_DOMAIN = 'http://testray-ci.liferay.com'
JENKINS_JOB = 'job/testray-pr-tester'
JENKINS_URL_SUFFIX = 'build'

JENKINS_API_URL = JENKINS_DOMAIN + '/' + JENKINS_JOB + '/' + JENKINS_URL_SUFFIX
JENKINS_CRUMB_URL = JENKINS_DOMAIN + '/' + JENKINS_CRUMB_API

##
## Global Variables
##

master_key = None

##
## Functions
##

def compat_dict_iter(dictionary):
	return dictionary.viewitems() if is_python_2() else dictionary.items()


def compat_input(message):
	return raw_input(message) if is_python_2() else input(message)


def decrypt(ciphertext, password, iv):
	key = hashlib.pbkdf2_hmac('sha256', password, iv, 100000)
	try:
		aes = AES.new(key, AES.MODE_GCM, iv)
	except AttributeError as ae:
		crypto_fail()
	return aes.decrypt(base64.b64decode(ciphertext))


def encrypt(plaintext, password, iv):
	key = hashlib.pbkdf2_hmac('sha256', password, iv, 100000)
	try:
		aes = AES.new(key, AES.MODE_GCM, iv)
	except AttributeError as ae:
		crypto_fail()
	return base64.b64encode(aes.encrypt(plaintext))


def execute_request(url, un, pw, data=None, headers=None):
	request = compat_urllib.Request(url)

	request.add_header('Accept', 'application/vnd.github.v3+json')
	request.add_header('Content-Type', 'application/json')

	if un:
		creds = un if pw is None else un + ':' + pw
		request.add_header('Authorization', 'Basic ' + base64.b64encode(creds))

	if headers is not None:
		for header, value in compat_dict_iter(headers):
			request.add_header(header, value)

	return compat_urllib.urlopen(request).read() if data is None else compat_urllib.urlopen(
		request, data).read()


def get_credentials(name, override=False):
	base_dirpath = os.path.dirname(os.path.abspath(__file__))

	parent_dirpath = os.path.join(base_dirpath, CREDENTIAL_DIRNAME)

	if not os.path.exists(parent_dirpath):
		os.makedirs(parent_dirpath)

	credential_filepath = os.path.join(parent_dirpath, name)

	if os.path.isfile(credential_filepath) and not override:
		with open(credential_filepath, 'r') as f:
			elements = f.read().splitlines()

		username = elements[0]
		password = decrypt(elements[1], get_master_key(), base64.b64decode(elements[2]))
	else:
		username = compat_input('Please enter your username for {}: '.format(name))
		password = getpass('Please enter password for {}: '.format(name))
		iv = os.urandom(BLOCK_SIZE)

		with open(credential_filepath, 'w') as f:
			f.write(username)
			f.write('\n')
			f.write(encrypt(password, get_master_key(), iv))
			f.write('\n')
			f.write(base64.b64encode(iv))
			f.write('\n')

	return (username, password)


def get_master_key():
	global master_key

	if master_key is None:
		master_key = getpass('Master Key (if you haven\'t created one yet, pick one now):')

	return master_key


def test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw):
	api_url = re.sub('github.com/(.*)/pull/(\d+)$', r'api.github.com/repos/\1/pulls/\2', pr_url)

	try:
		pr_info = json.loads(execute_request(api_url, github_un, github_pw))
	except IOError as e:
		if e.code == 401:
			print('Github authentication failed.')
			github_un, github_pw = get_credentials('github', True)
			return test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw)
		else:
			print('Error: {} {}'.format(e.code, e.reason))
			sys.exit()

	data = {
		'parameter': [
			{
				'name': 'BASE_BRANCH',
				'value': pr_info['base']['ref']
			},
			{
				'name': 'COMMENTS_API_URL',
				'value': pr_info['_links']['comments']['href']
			},
			{
				'name': 'HEAD_BRANCH',
				'value': pr_info['head']['ref']
			},
			{
				'name': 'HEAD_FETCH_URL',
				'value': pr_info['head']['repo']['ssh_url']
			}
		]
	}

	tickets = set()

	ticket_pattern = re.compile('[A-Z]+-[0-9]+')

	for text in (pr_info['title'], pr_info['body'], pr_info['head']['ref']):
		tickets.update(ticket_pattern.findall(text))

	if tickets:
		data['parameter'].append(
			{
				'name': 'JIRA_KEYS',
				'value': ','.join(tickets)
			}
		)

	try:
		crumb = execute_request(JENKINS_CRUMB_URL, jenkins_un, jenkins_pw)
	except IOError as e:
		if e.code == 401:
			print('Jenkins authentication failed.')
			jenkins_un, jenkins_pw = get_credentials('jenkins', True)
			return test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw)
		else:
			print('Error: {} {}'.format(e.code, e.reason))
			sys.exit()

	headers = {
		'Content-Type': 'application/x-www-form-urlencoded',
		crumb.split(':')[0]: crumb.split(':')[1]
	}

	try:
		return execute_request(
			JENKINS_API_URL, jenkins_un, jenkins_pw, 'json=' + json.dumps(data), headers)
	except IOError as e:
		if e.code == 401:
			print('Jenkins authentication failed.')
			jenkins_un, jenkins_pw = get_credentials('jenkins', True)
			return test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw)
		else:
			print('Error: {} {}'.format(e.code, e.reason))
			sys.exit()

##
## Main
##

if __name__ == "__main__":
	if len(sys.argv) != 2:
		print('Error. Requires exactly 1 argument: PR URL')
		sys.exit()

	pr_url = sys.argv[1]

	github_un, github_pw = get_credentials('github')
	jenkins_un, jenkins_pw = get_credentials('jenkins')

	print(test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw))

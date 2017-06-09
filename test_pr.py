#!/usr/bin/python

import base64
from Crypto.Cipher import AES
from getpass import getpass
import hashlib
import json
import os
import re
import sys

def is_python_2():
	return sys.version_info[0] == 2

if is_python_2():
	import urllib2 as compat_urllib
else:
	import urllib.request as compat_urllib

BLOCK_SIZE = 16

CREDENTIAL_DIRNAME = '.credentials'

JENKINS_CRUMB_API = 'crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'
JENKINS_DOMAIN = 'http://testray-ci.liferay.com'
JENKINS_JOB = 'job/misc/job/testray-pr-instance'
JENKINS_URL_SUFFIX = 'build'

JENKINS_API_URL = JENKINS_DOMAIN + '/' + JENKINS_JOB + '/' + JENKINS_URL_SUFFIX
JENKINS_CRUMB_URL = JENKINS_DOMAIN + '/' + JENKINS_CRUMB_API

master_key = None


def compat_dict_iter(dictionary):
	if is_python_2():
		return dictionary.viewitems()
	else:
		return dictionary.items()


def compat_print(message):
	if is_python_2():
		print message
	else:
		print(message)


def decrypt(ciphertext, password, iv):
	key = hashlib.pbkdf2_hmac('sha256', password, iv, 100000)
	aes = AES.new(key, AES.MODE_CFB, iv)
	return aes.decrypt(base64.b64decode(ciphertext))


def encrypt(plaintext, password, iv):
	key = hashlib.pbkdf2_hmac('sha256', password, iv, 100000)
	aes = AES.new(key, AES.MODE_CFB, iv)
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
		request, json.dumps(data)).read()


def get_master_key():
	global master_key

	if master_key is None:
		master_key = getpass('Master Key (if you haven\'t created one yet, pick one now):')

	return master_key


def get_password(name, override=False):
	master_key = get_master_key()

	base_dirpath = os.path.dirname(os.path.abspath(__file__))

	parent_dirpath = os.path.join(base_dirpath, CREDENTIAL_DIRNAME)

	if not os.path.exists(parent_dirpath):
		os.makedirs(parent_dirpath)

	credential_filepath = os.path.join(parent_dirpath, name)

	if os.path.isfile(credential_filepath) and not override:
		with open(credential_filepath, 'r') as f:
			elements = f.readlines()

		password = decrypt(elements[0], master_key, base64.b64decode(elements[1]))
	else:
		password = getpass('Please enter password for {}:'.format(name))
		iv = os.urandom(BLOCK_SIZE)

		with open(credential_filepath, 'w') as f:
			f.write(encrypt(password, master_key, iv))
			f.write('\n')
			f.write(base64.b64encode(iv))
			f.write('\n')

	return password


def test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw):
	api_url = re.sub('github.com/(.*)/pull/(\d+)$', r'api.github.com/repos/\1/pulls/\2', pr_url)

	try:
		pr_info = json.loads(execute_request(api_url, github_un, github_pw))
	except IOError as e:
		if e.code == 401:
			return test_pr(pr_url, github_un, get_password('github', True), jenkins_un, jenkins_pw)
		else:
			compat_print('Error github: {} {}'.format(e.code, e.reason))
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

	try:
		crumb = execute_request(JENKINS_CRUMB_URL, jenkins_un, jenkins_pw)
	except IOError as e:
		if e.code == 401:
			return test_pr(pr_url, github_un, github_pw, jenkins_un, get_password('jenkins', True))
		else:
			compat_print('Error: {} {}'.format(e.code, e.reason))
			sys.exit()

	headers = {
		crumb.split(':')[0]: crumb.split(':')[1]
	}

	try:
		return execute_request(JENKINS_API_URL, jenkins_un, jenkins_pw, data, headers)
	except IOError as e:
		if e.code == 401:
			return test_pr(pr_url, github_un, github_pw, jenkins_un, get_password('jenkins', True))
		else:
			compat_print('Error: {} {}'.format(e.code, e.reason))
			sys.exit()


if __name__ == "__main__":
	if len(sys.argv) != 4:
		compat_print('Error. Requires exactly 3 arguments: PR URL, GitHub username, Jenkins username')
		sys.exit()

	pr_url = sys.argv[1]
	github_un = sys.argv[2]
	jenkins_un = sys.argv[3]

	github_pw = None if ':' in github_un else get_password('github')
	jenkins_pw = None if ':' in jenkins_un else get_password('jenkins')

	compat_print(test_pr(pr_url, github_un, github_pw, jenkins_un, jenkins_pw))
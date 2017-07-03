#!/usr/bin/python

##
## Imports
##

import os
import sys

##
## Constants
##

CONFIG_FILE='.settings/bundles_location'
TELLTALE_FILE='readme.html'

##
## Functions
##

def file_contains(filepath, substring):
	with open(filepath, 'r') as f:
		return substring in f.read()


def get_bundle_superparent(override=False):
	base_dirpath = os.path.dirname(os.path.abspath(__file__))

	config_filepath = os.path.join(base_dirpath, CONFIG_FILE)

	parent_dirpath = os.path.dirname(config_filepath)

	if not os.path.exists(parent_dirpath):
		os.makedirs(parent_dirpath)

	if os.path.isfile(config_filepath) and not override:
		with open(config_filepath, 'r') as f:
			return f.read().strip()
	else:
		superparent_dirpath = raw_input('Please enter the directory in which your bundles can be found: ')

		with open(config_filepath, 'w') as f:
			f.write(superparent_dirpath)
			f.write('\n')

		return superparent_dirpath


def get_bundles(override=False):
	bundles = []
	superparent_dirpath = get_bundle_superparent(override)

	for (dirpath, dirnames, filenames) in os.walk(superparent_dirpath, topdown=True):
		if TELLTALE_FILE in filenames and file_contains(os.path.join(dirpath, TELLTALE_FILE), 'Liferay'):
			bundles.append(dirpath)

			# don't recurse through subdirectories as we've already found what we're looking for
			del dirnames[:]

	if not bundles:
		print('No bundles found in the indicated directory: {}'.format(superparent_dirpath))
		return get_bundles(True)
	else:
		return bundles


def get_user_choice_element(elements, message):
	for i, element in enumerate(elements, start=1):
		print('[{}]: {}'.format(i, element))

	print(message)
	print('Enter just the number:')

	choice_index = raw_input()
	return elements[int(choice_index) - 1]

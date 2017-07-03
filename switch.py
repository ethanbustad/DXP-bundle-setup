#!/usr/bin/python

##
## Imports
##

import _bundles
import getpass
import os
import sys

##
## Constants
##

CONFIG_FILE='.settings/source_location'
PATH_PROPERTY='app.server.parent.dir={}'
PROPERTIES_FILE='app.server.{}.properties'
TELLTALE_FILE='app.server.properties'

##
## Functions
##

def get_properties_filename():
	source_dirpath = get_source_dir()

	while not os.path.isfile(os.path.join(source_dirpath, TELLTALE_FILE)):
		print('Source not found in indicated directory: {}'.format(source_dirpath))
		source_dirpath = get_source_dir(True)

	username = getpass.getuser()

	properties_filename = os.path.join(source_dirpath, PROPERTIES_FILE.format(username))

	if os.path.isfile(properties_filename):
		with open(properties_filename, 'r') as rfile, open(properties_filename + '.old', 'w') as wfile:
			wfile.write(rfile.read())

	return properties_filename


def get_source_dir(override=False):
	base_dirpath = os.path.dirname(os.path.abspath(__file__))

	config_filepath = os.path.join(base_dirpath, CONFIG_FILE)

	parent_dirpath = os.path.dirname(config_filepath)

	if not os.path.exists(parent_dirpath):
		os.makedirs(parent_dirpath)

	if os.path.isfile(config_filepath) and not override:
		with open(config_filepath, 'r') as f:
			return f.read().strip()
	else:
		source_dirpath = raw_input('Please enter your Liferay source directory: ')

		with open(config_filepath, 'w') as f:
			f.write(source_dirpath)
			f.write('\n')

		return source_dirpath


def main(args):
	bundles = _bundles.get_bundles()

	choice_bundle = _bundles.get_user_choice_element(bundles, 'Switch to which bundle?')

	properties_filename = get_properties_filename()

	with open(properties_filename, 'w') as f:
		f.write(PATH_PROPERTY.format(choice_bundle))

##
## Main
##

if __name__ == "__main__":
	main(sys.argv[1:])

#!/usr/bin/python

##
## Imports
##

import _bundles
import os
import subprocess
import sys

##
## Constants
##

NEW_BUNDLE_OPTION='[Create new bundle...]'
NEW_LOCATION_OPTION='[Other...]'

##
## Functions
##

def get_bundle_parents():
	return list(set([os.path.dirname(bundle) for bundle in _bundles.get_bundles()]))


def get_bundle_path():
	bundles = _bundles.get_bundles()
	bundles.append(NEW_BUNDLE_OPTION)

	choice_bundle = _bundles.get_user_choice_element(bundles, 'Set up bundle in which location?')

	if choice_bundle == NEW_BUNDLE_OPTION:
		parents = get_bundle_parents()
		parents.append(NEW_LOCATION_OPTION)

		choice_parent = _bundles.get_user_choice_element(parents, 'Create new bundle in which directory?')

		if choice_parent == NEW_LOCATION_OPTION:
			choice_parent = raw_input('Enter parent directory for new bundle: ')

		bundle_name = raw_input('Enter directory name for new bundle: ')

		choice_bundle = os.path.join(choice_parent, bundle_name)

	if not os.path.exists(choice_bundle):
		os.makedirs(choice_bundle)

	return choice_bundle


def main(args):
	bundle_path = get_bundle_path()

	invoke_switch = query_yes_no('Switch to using this bundle?')

	subprocess.call('./set_up_bundle.sh', shell=True)

	if invoke_switch:
		import switch
		switch.switch_to(bundle_path)


def query_yes_no(question, default="yes"):
	if default is None:
		prompt = ' [y/n] '
	elif default == 'yes':
		prompt = ' [Y/n] '
	elif default == 'no':
		prompt = ' [y/N] '
	else:
		raise ValueError('Invalid default answer: "{}"'.format(default))

	valid = {'yes': True, 'y': True, 'ye': True, 'no': False, 'n': False}

	while True:
		choice = raw_input(question + prompt).lower()
		if default is not None and not choice:
			return valid[default]
		elif choice in valid:
			return valid[choice]
		else:
			print('Please respond with "yes" or "no" (or "y" or "n").')

##
## Main
##

if __name__ == '__main__':
	main(sys.argv[1:])

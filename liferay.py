#!/usr/bin/python
"""
Master script for invoking any python script in this repository.

This script exists as a convenience to set up just a single alias to execute many python scripts.

Available commands are:
test_pr

Example usage: python liferay.py test_pr [pr_url]
"""

##
## Imports
##

import sys

import test_pr

##
## Main
##

if __name__ == "__main__":
	if len(sys.argv) > 1:
		func = getattr(__import__(sys.argv[1]), 'main')
		if len(sys.argv) > 2:
			func(sys.argv[2:])
		else:
			func()
	else:
		print(__doc__)

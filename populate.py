#!/usr/bin/python

##
## Imports
##

from base64 import b64encode
import json
from collections import OrderedDict
import sys
import time
import urllib
import urllib2

##
## Constants
##

ADD_URL = 'http://localhost:8080/web/guest/home/-/testray/{}/add.json'

BULK_URL = 'http://localhost:8080/web/guest/home/-/testray/case_results/bulk.json'

COUNT_DEFAULT = 5

INPUT = {
	'case_types': [
		{
			'name': 'Automated Functional Test',
			'testTypeLabel': 'Automated Functional Test'
		},
		{
			'name': 'Manual Use Case',
			'testTypeLabel': 'Manual Use Case'
		},
		{
			'name': 'Unit Test',
			'testTypeLabel': 'Unit Test'
		},
		{
			'name': 'Integration Test',
			'testTypeLabel': 'Integration Test'
		},
		{
			'name': 'Modules Integration Test',
			'testTypeLabel': 'Modules Integration Test'
		}
	],
	'factor_categories': [
		{'name': 'Application Server'},
		{'name': 'Browser'},
		{'name': 'Database'},
		{'name': 'Java JDK'},
		{'name': 'Operating System'}
	],
	'factor_options': [
		{
			'name': 'Tomcat 8.0',
			'testrayFactorCategoryName': 'Application Server'
		},
		{
			'name': 'Wildfly 10.0',
			'testrayFactorCategoryName': 'Application Server'
		},
		{
			'name': 'Glassfish 3.1',
			'testrayFactorCategoryName': 'Application Server'
		},
		{
			'name': 'JBoss 7.0',
			'testrayFactorCategoryName': 'Application Server'
		},
		{
			'name': 'Jetty 9.0',
			'testrayFactorCategoryName': 'Application Server'
		},
		{
			'name': 'Chrome Latest',
			'testrayFactorCategoryName': 'Browser'
		},
		{
			'name': 'Firefox Latest',
			'testrayFactorCategoryName': 'Browser'
		},
		{
			'name': 'Safari Latest',
			'testrayFactorCategoryName': 'Browser'
		},
		{
			'name': 'Edge Latest',
			'testrayFactorCategoryName': 'Browser'
		},
		{
			'name': 'Internet Explorer 11.0',
			'testrayFactorCategoryName': 'Browser'
		},
		{
			'name': 'MariaDB 10.2',
			'testrayFactorCategoryName': 'Database'
		},
		{
			'name': 'MySQL 5.6',
			'testrayFactorCategoryName': 'Database'
		},
		{
			'name': 'Hypersonic',
			'testrayFactorCategoryName': 'Database'
		},
		{
			'name': 'PostgreSQL 9.6',
			'testrayFactorCategoryName': 'Database'
		},
		{
			'name': 'Microsoft SQL Server 2016',
			'testrayFactorCategoryName': 'Database'
		},
		{
			'name': 'Oracle JDK 8 64-bit',
			'testrayFactorCategoryName': 'Java JDK'
		},
		{
			'name': 'Oracle JDK 7 64-bit',
			'testrayFactorCategoryName': 'Java JDK'
		},
		{
			'name': 'OpenJDK 8',
			'testrayFactorCategoryName': 'Java JDK'
		},
		{
			'name': 'Oracle JDK 8 32-bit',
			'testrayFactorCategoryName': 'Java JDK'
		},
		{
			'name': 'Oracle JDK 6 32-bit',
			'testrayFactorCategoryName': 'Java JDK'
		},
		{
			'name': 'CentOS 7 64-Bit',
			'testrayFactorCategoryName': 'Operating System'
		},
		{
			'name': 'Windows 10 64-bit',
			'testrayFactorCategoryName': 'Operating System'
		},
		{
			'name': 'Ubuntu 16.4 64-bit',
			'testrayFactorCategoryName': 'Operating System'
		},
		{
			'name': 'Windows Server 2016',
			'testrayFactorCategoryName': 'Operating System'
		},
		{
			'name': 'Windows 7 64-bit',
			'testrayFactorCategoryName': 'Operating System'
		}
	],
	'projects': [
		{'name': 'Liferay Portal 7.0'},
		{'name': 'Liferay Portal 6.2'},
		{'name': 'Liferay Portal 6.1'},
		{'name': 'Liferay Portal 7.1'},
		{'name': 'Testray'}
	],
	'routines': [
		{
			'defaultTestrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Tomcat 8.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Chrome Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'CentOS 7 64-bit'}
			],
			'name': 'CE Development'
		},
		{
			'defaultTestrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Tomcat 8.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Chrome Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'CentOS 7 64-bit'}
			],
			'name': 'EE Development'
		},
		{
			'defaultTestrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Tomcat 8.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Chrome Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'CentOS 7 64-bit'}
			],
			'name': 'CE Development Acceptance'
		},
		{
			'defaultTestrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Tomcat 8.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Chrome Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'CentOS 7 64-bit'}
			],
			'name': 'CE Pull Request'
		},
		{
			'defaultTestrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Tomcat 8.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Chrome Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'CentOS 7 64-bit'}
			],
			'name': 'Environment Acceptance'
		}
	],
	'teams': [
		{'name': 'Business Productivity'},
		{'name': 'Collaboration'},
		{'name': 'Commerce'},
		{'name': 'Core Infrastructure'},
		{'name': 'Developer Tools'}
	],
	'components': [
		{
			'name': 'Calendar',
			'testrayTeamName': 'Business Productivity'
		},
		{
			'name': 'Forms',
			'testrayTeamName': 'Business Productivity'
		},
		{
			'name': 'Polls',
			'testrayTeamName': 'Business Productivity'
		},
		{
			'name': 'Reports',
			'testrayTeamName': 'Business Productivity'
		},
		{
			'name': 'Rules',
			'testrayTeamName': 'Business Productivity'
		},
		{
			'name': 'Workflow',
			'testrayTeamName': 'Business Productivity'
		},
		{
			'name': 'Akismet',
			'testrayTeamName': 'Collaboration'
		},
		{
			'name': 'Blogs',
			'testrayTeamName': 'Collaboration'
		},
		{
			'name': 'IP Geocoder',
			'testrayTeamName': 'Collaboration'
		},
		{
			'name': 'Message Boards',
			'testrayTeamName': 'Collaboration'
		},
		{
			'name': 'Microblogs',
			'testrayTeamName': 'Collaboration'
		},
		{
			'name': 'Wiki',
			'testrayTeamName': 'Collaboration'
		},
		{
			'name': 'Commerce 1',
			'testrayTeamName': 'Commerce'
		},
		{
			'name': 'Commerce 2',
			'testrayTeamName': 'Commerce'
		},
		{
			'name': 'Commerce 3',
			'testrayTeamName': 'Commerce'
		},
		{
			'name': 'Commerce 4',
			'testrayTeamName': 'Commerce'
		},
		{
			'name': 'Commerce 5',
			'testrayTeamName': 'Commerce'
		},
		{
			'name': 'Commerce 6',
			'testrayTeamName': 'Commerce'
		},
		{
			'name': 'Auditing',
			'testrayTeamName': 'Core Infrastructure'
		},
		{
			'name': 'Clustering',
			'testrayTeamName': 'Core Infrastructure'
		},
		{
			'name': 'Custom Fields',
			'testrayTeamName': 'Core Infrastructure'
		},
		{
			'name': 'Deployment',
			'testrayTeamName': 'Core Infrastructure'
		},
		{
			'name': 'Permissions',
			'testrayTeamName': 'Core Infrastructure'
		},
		{
			'name': 'Roles',
			'testrayTeamName': 'Core Infrastructure'
		},
		{
			'name': 'Blade Samples',
			'testrayTeamName': 'Developer Tools'
		},
		{
			'name': 'Liferay Developer Studio',
			'testrayTeamName': 'Developer Tools'
		},
		{
			'name': 'Liferay IDE',
			'testrayTeamName': 'Developer Tools'
		},
		{
			'name': 'Ant Build Tools',
			'testrayTeamName': 'Developer Tools'
		},
		{
			'name': 'Gradle Build Tools',
			'testrayTeamName': 'Developer Tools'
		},
		{
			'name': 'Workspaces',
			'testrayTeamName': 'Developer Tools'
		}
	],
	'product_versions': [
		{
			'name': '7.0.x',
			'testrayProjectName': 'Liferay Portal 7.0',
		},
		{
			'name': 'ee-7.0.x',
			'testrayProjectName': 'Liferay Portal 7.0',
		},
		{
			'name': '7.0.1',
			'testrayProjectName': 'Liferay Portal 7.0',
		},
		{
			'name': '7.0.2',
			'testrayProjectName': 'Liferay Portal 7.0',
		},
		{
			'name': '7.0 CE GA4',
			'testrayProjectName': 'Liferay Portal 7.0',
		},
		{
			'name': '6.2.x',
			'testrayProjectName': 'Liferay Portal 6.2',
		},
		{
			'name': 'ee-6.2.x',
			'testrayProjectName': 'Liferay Portal 6.2',
		},
		{
			'name': '6.2.1',
			'testrayProjectName': 'Liferay Portal 6.2',
		},
		{
			'name': '6.2.2',
			'testrayProjectName': 'Liferay Portal 6.2',
		},
		{
			'name': '6.2 CE GA4',
			'testrayProjectName': 'Liferay Portal 6.2',
		},
		{
			'name': '6.1.x',
			'testrayProjectName': 'Liferay Portal 6.1',
		},
		{
			'name': 'ee-6.1.x',
			'testrayProjectName': 'Liferay Portal 6.1',
		},
		{
			'name': '6.1.1',
			'testrayProjectName': 'Liferay Portal 6.1',
		},
		{
			'name': '6.1.2',
			'testrayProjectName': 'Liferay Portal 6.1',
		},
		{
			'name': '6.1 CE GA4',
			'testrayProjectName': 'Liferay Portal 6.1',
		},
		{
			'name': '7.1.x',
			'testrayProjectName': 'Liferay Portal 7.1',
		},
		{
			'name': 'ee-7.1.x',
			'testrayProjectName': 'Liferay Portal 7.1',
		},
		{
			'name': '7.1.1',
			'testrayProjectName': 'Liferay Portal 7.1',
		},
		{
			'name': '7.1.2',
			'testrayProjectName': 'Liferay Portal 7.1',
		},
		{
			'name': '7.1 CE GA4',
			'testrayProjectName': 'Liferay Portal 7.1',
		},
		{
			'name': '1.0.0',
			'testrayProjectName': 'Testray',
		},
		{
			'name': '1.0.1',
			'testrayProjectName': 'Testray',
		},
		{
			'name': '1.1.0',
			'testrayProjectName': 'Testray',
		},
		{
			'name': '1.1.1',
			'testrayProjectName': 'Testray',
		},
		{
			'name': '2.0.0',
			'testrayProjectName': 'Testray',
		}
	],
	'builds': [{}],# no data necessary here -- all generated programmatically
	'runs': [
		{
			'testrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Wildfly 10.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Firefox Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'Ubuntu 16.4 64-bit'}
			]
		},
		{
			'testrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Tomcat 8.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Safari Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'Ubuntu 16.4 64-bit'}
			]
		},
		{
			'testrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Wildfly 10.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Firefox Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MySQL 5.6'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'Oracle JDK 6 32-bit'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'Ubuntu 16.4 64-bit'}
			]
		},
		{
			'testrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Wildfly 10.0'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Edge Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'OpenJDK 8'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'CentOS 7 64-bit'}
			]
		},
		{
			'testrayFactors': [
				{'testrayFactorCategoryName': 'Application Server',
					'testrayFactorOptionName': 'Glassfish 3.1'},
				{'testrayFactorCategoryName': 'Browser',
					'testrayFactorOptionName': 'Safari Latest'},
				{'testrayFactorCategoryName': 'Database',
					'testrayFactorOptionName': 'MariaDB 10.2'},
				{'testrayFactorCategoryName': 'Java JDK',
					'testrayFactorOptionName': 'Oracle JDK 8 64-bit'},
				{'testrayFactorCategoryName': 'Operating System',
					'testrayFactorOptionName': 'Ubuntu 16.4 64-bit'}
			]
		}
	],
	'cases': [{}],# no data necessary here -- all generated programmatically
	'case_results': [
		{
			'errors': 'This is an error with randomish value {}',
			'status': 3,
			'warnings': [
				'Warning 1',
				'Warning 2',
				'Warning 3',
				'Warning 4'
			]
		},
		{
			'status': 2
		}
	]
}

USERNAME = 'test@liferay.com'
PASSWORD = 'test'

##
## Variables
##

OUTPUT = {}

##
## Functions
##

def create_data(instructions):
	finished_models = ['case_results']

	for model in instructions:
		if model not in finished_models:
			create_models(model, instructions, finished_models, {})

	for project_id, routine_ids in OUTPUT['routines'].iteritems():
		case_ids = OUTPUT['cases'][project_id]

		for routine_id in routine_ids:
			case_results = []

			for build_id in OUTPUT['builds'][routine_id]:
				for run_id in OUTPUT['runs'][build_id]:
					for case_id in case_ids:
						nonce = int(case_id) ^ int(run_id)
						case_results.append({
							'errors': get_errors(nonce),
							'status': get_status(nonce),
							'testrayCaseId': case_id,
							'testrayRunId': run_id,
							'warnings': get_warnings(nonce)
						})

			request = urllib2.Request(BULK_URL)

			request.add_header('Authorization', 'Basic ' + b64encode(USERNAME + ':' + PASSWORD))

			try:
				results = json.loads(
					urllib2.urlopen(request, urllib.urlencode({'caseResultsJSONArrayString': json.dumps(case_results)})).read()
				)['data']
			except urllib2.HTTPError as e:
				print(e.read())
				sys.exit(1)

			print('Created {} results.'.format(len(results)))


def create_models(model, instructions, finished_models, reusable_params):
	data_objs = INPUT[model]

	if instructions[model] > len(data_objs):
		extras_necessary = instructions[model] - len(data_objs) + 1

		dummy_obj = data_objs.pop()

		for i in range(extras_necessary):
			data_objs.append({
				key: value.format(i) for key, value in dummy_obj.iteritems()
			})

	for i in range(instructions[model]):
		params = data_objs[i]

		if model == 'product_versions' and params.get('testrayProjectName') != reusable_params.get('testrayProjectName'):
			continue
		elif model == 'factor_options' and params.get('testrayFactorCategoryName') != reusable_params.get('testrayFactorCategoryName'):
			continue
		elif model == 'components' and params.get('testrayTeamName') != reusable_params.get('testrayTeamName'):
			continue

		for key, value in reusable_params.iteritems():
			params[key] = value(i, reusable_params) if callable(value) else value

		result = do_add_api(model, params)

		# conditionally store data globally
		if model == 'case_types':
			if model not in OUTPUT:
				OUTPUT[model] = []
			OUTPUT[model].append(result['testrayCaseTypeId'])
		elif model == 'factor_categories':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			OUTPUT[model][result['name']] = result['testrayFactorCategoryId']
		elif model == 'projects':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			OUTPUT[model][result['name']] = result['testrayProjectId']
		elif model == 'product_versions':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			if result['testrayProjectId'] not in OUTPUT[model]:
				OUTPUT[model][result['testrayProjectId']] = []
			OUTPUT[model][result['testrayProjectId']].append(result['testrayProductVersionId'])
		elif model == 'routines':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			if result['testrayProjectId'] not in OUTPUT[model]:
				OUTPUT[model][result['testrayProjectId']] = []
			OUTPUT[model][result['testrayProjectId']].append(result['testrayRoutineId'])
		elif model == 'builds':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			if result['testrayRoutineId'] not in OUTPUT[model]:
				OUTPUT[model][result['testrayRoutineId']] = []
			OUTPUT[model][result['testrayRoutineId']].append(result['testrayBuildId'])
		elif model == 'cases':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			if result['testrayProjectId'] not in OUTPUT[model]:
				OUTPUT[model][result['testrayProjectId']] = []
			OUTPUT[model][result['testrayProjectId']].append(result['testrayCaseId'])
		elif model == 'runs':
			if model not in OUTPUT:
				OUTPUT[model] = {}
			if result['testrayBuildId'] not in OUTPUT[model]:
				OUTPUT[model][result['testrayBuildId']] = []
			OUTPUT[model][result['testrayBuildId']].append(result['testrayRunId'])

		# conditionally recurse
		if model == 'factor_categories':
			create_models(
				'factor_options', instructions, finished_models,
				{
					'testrayFactorCategoryId': result['testrayFactorCategoryId'],
					'testrayFactorCategoryName': result['name']
				}
			)
		elif model == 'projects':
			create_models(
				'product_versions', instructions, finished_models,
				{
					'testrayProjectId': result['testrayProjectId'],
					'testrayProjectName': result['name']
				}
			)
			create_models('teams', instructions, finished_models, {'testrayProjectId': result['testrayProjectId']})
			create_models('routines', instructions, finished_models, {'testrayProjectId': result['testrayProjectId']})
		elif model == 'routines':
			create_models(
				'builds', instructions, finished_models,
				{
					'name': get_testray_build_name,
					'testrayProductVersionId': get_testray_product_version_id,
					'testrayRoutineId': result['testrayRoutineId']
				}
			)
		elif model == 'teams':
			create_models(
				'components', instructions, finished_models,
				{
					'testrayTeamId': result['testrayTeamId'],
					'testrayTeamName': result['name']
				}
			)
		elif model == 'components':
			create_models(
				'cases', instructions, finished_models,
				{
					'estimatedDuration': 30,
					'name': get_testray_case_name,
					'priority': get_testray_case_priority,
					'testrayCaseTypeId': OUTPUT['case_types'][0],
					'testrayComponentId': result['testrayComponentId'],
					'testrayComponentName': result['name'],
					'testrayProjectId': result['testrayProjectId']
				}
			)
		elif model == 'builds':
			create_models('runs', instructions, finished_models, {'testrayBuildId': result['testrayBuildId']})

	finished_models.append(model)


def do_add_api(model, params):
	request = urllib2.Request(ADD_URL.format(model) + '?' + urllib.urlencode(params))

	request.add_header('Authorization', 'Basic ' + b64encode(USERNAME + ':' + PASSWORD))

	try:
		response = json.loads(urllib2.urlopen(request).read())['data']
	except urllib2.HTTPError as e:
		print(e.read())
		sys.exit(1)

	print('Created {} {}.'.format(model[:-1], response.get('name') or response.get('number')))

	return response


def get_errors(nonce):
	errors = INPUT['case_results'][nonce % 2].get('errors')

	return errors.format(nonce % 7) if errors else ''


def get_instructions():
	models = [
		'case_types', 'factor_categories', 'factor_options', 'projects', 'routines', 'teams', 'components',
		'product_versions', 'builds', 'runs'
	]

	instructions = OrderedDict((model, len(INPUT[model])) for model in models)

	configurable_models = ['cases', 'case_results']

	chosen_count = int(
		raw_input('How many case results to create per run[{}]:'.format(COUNT_DEFAULT)) or COUNT_DEFAULT
	)

	for model in configurable_models:
		instructions[model] = chosen_count

	return instructions


def get_status(nonce):
	return INPUT['case_results'][nonce % 2].get('status')


def get_testray_build_name(index, params):
	return 'Build {}, {}'.format(index + 1, time.strftime('%Y-%m-%d %H:%M:%S'))


def get_testray_case_name(index, params):
	return '{} Case #{}'.format(params['testrayComponentName'], index + 1)


def get_testray_case_priority(index, params):
	return index % 5 + 1


def get_testray_product_version_id(index, params):
	testrayProjectId = next(
		(pId for pId, routineIds in OUTPUT['routines'].iteritems() if params['testrayRoutineId'] in routineIds),
		None
	)

	return OUTPUT['product_versions'][testrayProjectId][index % len(OUTPUT['product_versions'])]


def get_warnings(nonce):
	warnings = INPUT['case_results'][nonce % 2].get('warnings')

	return ','.join(warnings[0:nonce % 4]) if warnings else ''


def main():
	create_data(get_instructions())

##
## Main
##

if __name__ == '__main__':
	main()

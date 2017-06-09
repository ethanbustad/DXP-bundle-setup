#!/bin/bash

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

BASE_DIR="$(pwd)"

DESIRED_HOME_DIR_NAME=7.0.x
FIX_PACK=de/liferay-fix-pack-de-16
INDEX_NAME=PR_tester_
LIFERAY_HOME_PARENT_DIR=$BASE_DIR/bundles
LOG_DIR=$BASE_DIR/logs
MYSQL_USER_NAME=pr_tester
MYSQL_USER_PASSWORD=testrayprtester
PORTAL_REPO_DIR=$BASE_DIR/liferay-portal-ee
PORTAL_REMOTE_BASE=git@github.com:liferay/liferay-portal-ee.git
PORTAL_REMOTE_BASE_BRANCH=ee-7.0.x
SSH_KEY_FILE=~/.ssh/id_rsa_ethan.bustad_liferay.com
SUBREPO_LOCATION=$PORTAL_REPO_DIR/modules/private/apps/osb-testray
SUBREPO_NAME=com-liferay-osb-testray-private
SUBREPO_REMOTE_BASE=git@github.com:liferay/$SUBREPO_NAME
SUBREPO_REMOTE_BASE_BRANCH=${BASE_BRANCH:-7.0.x-private}

if [ -e variables-ext.sh ]
then
	source variables-ext.sh
fi

if [ ! -z "$MYSQL_USER_PASSWORD" ]; then
	MYSQL_PASSWORD_ARGUMENT="-p${MYSQL_USER_PASSWORD}"
fi

# An array of properties as they should appear in portal-ext.properties.
# Include at least database settings.
PORTAL_EXTRA_PROPERTIES=(
	"jdbc.default.driverClassName=org.mariadb.jdbc.Driver"
	"jdbc.default.password=$MYSQL_USER_PASSWORD"
	"jdbc.default.url=jdbc:mysql://localhost/lportal?characterEncoding=UTF-8&useFastDateParsing=false&useUnicode=true"
	"jdbc.default.username=$MYSQL_USER_NAME"
)

# An array of modules to deploy from liferay-portal-ee.
# Include the relative path starting from $repo/modules.
DEPLOYABLE_PORTAL_MODULES=(
	"private/apps/osb-testray/osb-testray-portlet"
	"private/apps/osb-testray/osb-testray-theme"
	"private/apps/osb-testray/osb-testray-dashboard/osb-testray-dashboard-gateway"
	"private/apps/osb-testray/osb-testray-dashboard/osb-testray-dashboard-web"
)

fetch_dependency () {
	CACHE_DIR="$BASE_DIR/.cache"
	url=$1

	mkdir -p $CACHE_DIR

	md5=$(echo -n "$url" | md5sum | cut -f1 -d' ')

	if [ ! -e $CACHE_DIR/$md5 ]
	then
		wget -q $url -O $CACHE_DIR/$md5
	fi

	echo "$CACHE_DIR/$md5"
}

if [ -e variables-ext.sh ]
then
	source variables-ext.sh
fi

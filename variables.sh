#!/bin/bash

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

DESIRED_HOME_DIR_NAME=7.0.x
FIX_PACK=de/liferay-fix-pack-de-11
INDEX_NAME=_DEFAULT_INDEX_NAME_
LIFERAY_HOME_PARENT_DIR=/path/to/home/parent
PORTAL_REPO_DIR=/path/to/portal/repo

# An array of properties as they should appear in portal-ext.properties.
# Include at least database settings.
PORTAL_EXTRA_PROPERTIES=(
	"jdbc.default.driverClassName=com.mysql.jdbc.Driver"
	"jdbc.default.password="
	"jdbc.default.url=jdbc:mysql://localhost/lportal?characterEncoding=UTF-8&useFastDateParsing=false&useUnicode=true"
	"jdbc.default.username="
)

if [ -e variables-ext.sh ]
then
	source variables-ext.sh
fi

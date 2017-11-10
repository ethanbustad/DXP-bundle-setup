#!/bin/bash

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

DESIRED_HOME_DIR_NAME=7.0.x
FIX_PACK=de/liferay-fix-pack-de-16
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

# An array of modules to deploy from liferay-portal-ee.
# Include the relative path starting from $repo/modules.
DEPLOYABLE_PORTAL_MODULES=(
	"private/apps/osb-testray"
)

# An array of modules to download and deploy.
# Include the URL to the module .jar file.
DEPLOYABLE_URL_MODULES=(
	"https://cdn.lfrs.sl/repository.liferay.com/nexus/content/groups/public/com/liferay/com.liferay.alloy.mvc/2.0.0/com.liferay.alloy.mvc-2.0.0.jar"
	"https://cdn.lfrs.sl/repository.liferay.com/nexus/content/groups/public/com/liferay/com.liferay.petra.lang/1.0.0/com.liferay.petra.lang-1.0.0.jar"
	"https://cdn.lfrs.sl/repository.liferay.com/nexus/content/groups/public/com/liferay/com.liferay.petra.string/1.0.0/com.liferay.petra.string-1.0.0.jar"
)

if [ -e variables-ext.sh ]
then
	source variables-ext.sh
fi

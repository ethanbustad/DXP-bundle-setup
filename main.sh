#!/bin/bash

echo Starting at `date "+%F %T.%N"`

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

source variables.sh

pr_repo=$1
pr_branch=$2

# -----------------------------------------------------------------------------
# Executes bundle setup script in background, outputting to log file.
# -----------------------------------------------------------------------------

mkdir -p $LOG_DIR

bash ./set_up_bundle.sh > $LOG_DIR/initialize_bundle.log &


# -----------------------------------------------------------------------------
# Sets up database
# -----------------------------------------------------------------------------

if ! type mysql > /dev/null
then
	echo "====================== Installing MariaDB... ======================"

	export DEBIAN_FRONTEND=noninteractive

	apt-get -q -y install mariadb-client-core-10.0
	apt-get -q -y install mariadb-server-core-10.0
	apt-get -q -y install mariadb-client-10.0
	apt-get -q -y install mariadb-server-10.0

	mysql_install_db
	service mysql start
fi

echo "======================== Restoring data... ========================"

mysql < database/create.sql

# -----------------------------------------------------------------------------
# Sets up tests
# -----------------------------------------------------------------------------

if [ ! -e $PORTAL_REPO_DIR ]
then
	echo "==================== Setting up portal repo... ===================="

	PORTAL_TARGZ=`fetch_dependency "http://mirrors.lax.liferay.com/github.com/liferay/liferay-portal-ee.tar.gz"`

	mkdir -p $PORTAL_REPO_DIR/temp

	tar -x -f $PORTAL_TARGZ --directory $PORTAL_REPO_DIR/temp

	mv $PORTAL_REPO_DIR/temp/liferay-portal-ee/{*,.[^.]*} $PORTAL_REPO_DIR

	rmdir $PORTAL_REPO_DIR/temp/liferay-portal-ee
	rmdir $PORTAL_REPO_DIR/temp

	git --git-dir=$PORTAL_REPO_DIR/.git remote add upstream git@github.com:liferay/liferay-portal-ee.git
fi

echo "=================== Setting up relevant code... ==================="

rebase_successful=true

cd $PORTAL_REPO_DIR

git fetch --no-tags $REMOTE_BASE $REMOTE_BASE_BRANCH

git clean -dfx

git fetch -f --no-tags $pr_repo $pr_branch

git checkout FETCH_HEAD

git rebase ${REMOTE_BASE}/${REMOTE_BASE_BRANCH}

if [ -e $PORTAL_REPO_DIR/.git/rebase-apply ]
then
	git rebase --abort

	rebase_successful=false
fi

ant setup-sdk

echo "================ Waiting for bundle to be ready... ================"

until grep -qs "The installation was successful" $LOG_DIR/apply_fixpack.log
do
	sleep 5s
done

echo "==================== Running backend tests... ====================="

# ??
# TODO
# this is probably where we should handle the 'rebase_successful' variable

echo "this is where we'd run backend tests"

#
#

echo "====================== Deploying modules... ======================="

for MODULE in ${DEPLOYABLE_PORTAL_MODULES[@]}; do
	cd $PORTAL_REPO_DIR/$MODULE

	if [ -e $PORTAL_REPO_DIR/$MODULE/build.xml ]
	then
		ant "-Dapp.server.deploy.dir=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/deploy" deploy
	else
		$PORTAL_REPO_DIR/gradlew --no-daemon "-Dliferay.home=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME" deploy
	fi
done

echo "=============== Waiting for Liferay to start up... ================"

today=`date "+%F"`

until grep --quiet "The installation was successful" $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat/logs/catalina.${today}.log
do
	sleep 5s
done

echo "==================== Running runtime tests... ====================="

# ??
# TODO

echo "this is where we'd run runtime tests"

#
#

echo "============================= Done... ============================="

echo Finished at `date "+%F %T.%N"`

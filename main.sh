#!/bin/bash

echo Starting at `date "+%F %T.%N"`

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

source variables.sh

pr_repo=$1
pr_branch=$2

eval `ssh-agent -s`
ssh-add ${SSH_KEY_FILE}

# -----------------------------------------------------------------------------
# Executes bundle setup script in background, outputting to log file.
# -----------------------------------------------------------------------------

mkdir -p $LOG_DIR

bash ./set_up_bundle.sh > $LOG_DIR/initialize_bundle.log 2>&1 &

# -----------------------------------------------------------------------------
# Sets up database
# -----------------------------------------------------------------------------

if ! type mysql > /dev/null 2>&1
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

mysql -u ${MYSQL_USER_NAME} -p${MYSQL_USER_PASSWORD} < database/create.sql

# -----------------------------------------------------------------------------
# Sets up ant
# -----------------------------------------------------------------------------

if ! type ant > /dev/null 2>&1
then
	echo "======================== Installing Ant... ========================"

	export DEBIAN_FRONTEND=noninteractive

	apt-get -q -y install ant
fi

export ANT_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

# -----------------------------------------------------------------------------
# Sets up tests
# -----------------------------------------------------------------------------

if [ ! -e $PORTAL_REPO_DIR ]
then
	echo "==================== Setting up portal repo... ===================="

	mkdir -p $PORTAL_REPO_DIR/temp

	curl "http://mirrors.lax.liferay.com/github.com/liferay/liferay-portal-ee.tar.gz" | tar -x -z --directory $PORTAL_REPO_DIR/temp

	mv $PORTAL_REPO_DIR/temp/liferay-portal-ee/{*,.[^.]*} $PORTAL_REPO_DIR

	rmdir $PORTAL_REPO_DIR/temp/liferay-portal-ee $PORTAL_REPO_DIR/temp &

	git --git-dir=$PORTAL_REPO_DIR/.git remote add upstream git@github.com:liferay/liferay-portal-ee.git
fi

echo "=================== Setting up relevant code... ==================="

rebase_successful=true

cd $PORTAL_REPO_DIR || exit 1

git fetch --no-tags $REMOTE_BASE $REMOTE_BASE_BRANCH

git clean -dfx

git fetch -f --no-tags $pr_repo $pr_branch

git checkout -f FETCH_HEAD

git rebase ${REMOTE_BASE}/${REMOTE_BASE_BRANCH}

if [ -e $PORTAL_REPO_DIR/.git/rebase-apply ]
then
	git rebase --abort

	rebase_successful=false
fi

ant "-Dapp.server.parent.dir=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME" setup-sdk

echo "================ Waiting for bundle to be ready... ================"

until grep -qs "The installation was successful" $LOG_DIR/apply_fixpack.log
do
	sleep 5s

	((i++)) && ((i==60)) && exit 1
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
	cd $PORTAL_REPO_DIR/modules/$MODULE

	if [ -e $PORTAL_REPO_DIR/$MODULE/build.xml ]
	then
		ant "-Dapp.server.deploy.dir=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/deploy" deploy
	else
		$PORTAL_REPO_DIR/gradlew --no-daemon "-Dliferay.home=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME" deploy
	fi
done

echo "=============== Waiting for Liferay to start up... ================"

until grep -qs "Server startup" $LOG_DIR/catalina.log
do
	sleep 5s

	((j++)) && ((j==60)) && exit 1
done

echo "==================== Running runtime tests... ====================="

# ??
# TODO

echo "this is where we'd run runtime tests"

#
#

echo "============================= Done... ============================="

echo Finished at `date "+%F %T.%N"`

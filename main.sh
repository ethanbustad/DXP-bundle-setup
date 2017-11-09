#!/bin/bash

echo Starting at `date "+%F %T.%N"`

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

source variables.sh

pr_repo=${HEAD_FETCH_URL/https:\/\/github.com\//git@github.com:}
pr_branch=$HEAD_BRANCH

echo "Testing branch $pr_branch on repo $pr_repo."

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

mysql -u $MYSQL_USER_NAME $MYSQL_PASSWORD_ARGUMENT < database/create.sql

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
fi

echo "=================== Setting up relevant code... ==================="

remote_base=$PORTAL_REMOTE_BASE
remote_base_branch=$PORTAL_REMOTE_BASE_BRANCH

rebase_successful=true

cd $PORTAL_REPO_DIR || exit 1

git fetch --no-tags $PORTAL_REMOTE_BASE $PORTAL_REMOTE_BASE_BRANCH

git clean -dfx

if [ ! -z $SUBREPO_NAME ]
then
	remote_base=$SUBREPO_REMOTE_BASE
	remote_base_branch=$SUBREPO_REMOTE_BASE_BRANCH

	git checkout -f FETCH_HEAD

	subrepo_zipfile=`fetch_dependency "http://mirrors.lax.liferay.com/github.com/liferay/${SUBREPO_NAME}.tar.gz"`

	rm -rf $SUBREPO_LOCATION

	subrepo_parent_dir="$(dirname "$SUBREPO_LOCATION")"

	tar -x -z -f "$subrepo_zipfile" --directory "$subrepo_parent_dir"

	mv $subrepo_parent_dir/$SUBREPO_NAME $SUBREPO_LOCATION

	cd $SUBREPO_LOCATION || exit 1

	git fetch --no-tags $SUBREPO_REMOTE_BASE $SUBREPO_REMOTE_BASE_BRANCH

	git clean -dfx
fi

git fetch -f --no-tags ${remote_base} ${remote_base_branch}:base

git fetch -f --no-tags $pr_repo $pr_branch

git checkout -f FETCH_HEAD

git rebase base

if [ -e $PORTAL_REPO_DIR/.git/rebase-apply ]
then
	git rebase --abort

	rebase_successful=false
fi

git branch -D base

ant "-Dapp.server.parent.dir=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME" -f $PORTAL_REPO_DIR/build.xml setup-sdk

echo "================ Waiting for bundle to be ready... ================"

until grep -qs "The installation was successful" $LOG_DIR/apply_fixpack.log
do
	sleep 5s

	((i++)) && ((i==60)) && exit 1
done

echo "====================== Deploying modules... ======================="

for MODULE in ${DEPLOYABLE_PORTAL_MODULES[@]}; do
	cd $PORTAL_REPO_DIR/modules/$MODULE

	if [ -e $PORTAL_REPO_DIR/modules/$MODULE/build.xml ]
	then
		ant "-Dapp.server.deploy.dir=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/deploy" deploy
	else
		sudo $PORTAL_REPO_DIR/gradlew --no-daemon "-Dliferay.home=$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME" deploy
	fi
done

for MODULE in ${DEPLOYABLE_URL_MODULES[@]}; do
	filename=$(basename "$MODULE")

	wget "$MODULE" -O "$filename"

	mv -v "$filename" "$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/osgi/modules/${filename/-[0-9]\.[0-9]\.[0-9]\.jar/.jar}"
done

echo "=============== Waiting for Liferay to start up... ================"

until grep -qs "Server startup" $LOG_DIR/catalina.log
do
	sleep 5s
done

echo "============================= Done... ============================="

echo Finished at `date "+%F %T.%N"`

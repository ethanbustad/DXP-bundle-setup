#!/bin/bash

# -----------------------------------------------------------------------------
# Sets variables to use within script.
# -----------------------------------------------------------------------------

source variables.sh

# --------------------------------------------------------------
# Initializes the server for Liferay DXP.
# --------------------------------------------------------------

echo "================== Extracting bundle archive... ==================="

mkdir -p $LIFERAY_HOME_PARENT_DIR/temp

BUNDLE_ZIPFILE=`fetch_dependency "http://mirrors.lax.liferay.com/files.liferay.com/private/ee/portal/7.0.10.1/liferay-dxp-digital-enterprise-tomcat-7.0-sp1-20161027112321352.zip"`

unzip -d $LIFERAY_HOME_PARENT_DIR/temp -q "$BUNDLE_ZIPFILE"

rm -rf $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME

mv $LIFERAY_HOME_PARENT_DIR/temp/liferay-* $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME

rm -rf $LIFERAY_HOME_PARENT_DIR/temp

rm -rf $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/work $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat-*/temp $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat-*/work

ln -s `ls $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME | grep "tomcat-"` $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat

echo "==================== Setting up DXP license... ===================="

mkdir $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/deploy/
cp license/* $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/deploy/

echo "=================== Applying configurations... ===================="

cp properties/* $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat/webapps/ROOT/WEB-INF/classes

for PROPERTY in ${PORTAL_EXTRA_PROPERTIES[@]}; do
	echo -e "\n$PROPERTY" >> $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat/webapps/ROOT/WEB-INF/classes/portal-ext.properties
done

mkdir -p $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/osgi/configs

for FILENAME in configs/*; do
	sed "s/indexNamePrefix = .*/indexNamePrefix = $INDEX_NAME/g" $FILENAME > $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/osgi/configs/$(basename "$FILENAME")
done

cp -br tomcat/ $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat/

echo "======================= Applying fixpack... ======================="

rm -rf $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/

LATEST_PATCHING_TOOL=patching-tool-`curl --silent http://mirrors.lax.liferay.com/files.liferay.com/private/ee/fix-packs/patching-tool/LATEST-2.0.txt`.zip

PATCHING_TOOL_ZIPFILE=`fetch_dependency "http://mirrors.lax.liferay.com/files.liferay.com/private/ee/fix-packs/patching-tool/${LATEST_PATCHING_TOOL}"`

unzip -d $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME -q "$PATCHING_TOOL_ZIPFILE"

chmod u+x $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/*.sh

echo -e "patching.mode=binary\nwar.path=../tomcat/webapps/ROOT/\nglobal.lib.path=../tomcat/lib/ext/\nliferay.home=../" > $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/default.properties

$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patching-tool.sh auto-discovery ..${PATCHING_DIR}
$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patching-tool.sh revert

rm -fr $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patches/*

FIXPACK_ZIPFILE=`fetch_dependency "http://mirrors.lax.liferay.com/files.liferay.com/private/ee/fix-packs/7.0.10/${FIX_PACK}-7010.zip"`

cat "$FIXPACK_ZIPFILE" > $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patches/patch.zip

PATCH_INFO=`$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patching-tool.sh info | grep '\[ x\]\|\[ D\]\|\[ o\]\|\[ s\]'`

if [[ ! -z ${PATCH_INFO} ]]
then
	echo "Unable to patch:"
	echo "${PATCH_INFO}"

	rm /tmp/peek_redeploy.lock

	exit 0
fi

$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patching-tool.sh install > $LOG_DIR/apply_fixpack.log
$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/patching-tool/patching-tool.sh update-plugins

rm -fr $LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/osgi/state

echo "======================== Starting portal... ======================="

$LIFERAY_HOME_PARENT_DIR/$DESIRED_HOME_DIR_NAME/tomcat/bin/catalina.sh run > $LOG_DIR/catalina.log 2>&1 &

LIFERAY_PID=$!

echo "$LIFERAY_PID" > $LOG_DIR/liferay_pid.log

echo "============================== Done. =============================="

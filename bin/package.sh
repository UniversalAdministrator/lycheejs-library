#!/bin/bash

echo "SUCCESS";
exit 0;

LYCHEEJS_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../../../"; pwd);
PROJECT_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../"; pwd);
LYCHEEJS_HELPER=`which lycheejs-helper`;

CURRENT_YEAR=`date +%Y`;  # 2016
CURRENT_MONTH=`date +%m`; # 05
RELEASE_VERSION="";

if [ $CURRENT_MONTH -gt "09" ]; then
	RELEASE_VERSION="$CURRENT_YEAR-Q4";
elif [ $CURRENT_MONTH -gt "06" ]; then
	RELEASE_VERSION="$CURRENT_YEAR-Q3";
elif [ $CURRENT_MONTH -gt "03" ]; then
	RELEASE_VERSION="$CURRENT_YEAR-Q2";
else
	RELEASE_VERSION="$CURRENT_YEAR-Q1";
fi;


if [ "$LYCHEEJS_HELPER" == "" ]; then
	LYCHEEJS_HELPER="$LYCHEEJS_ROOT/bin/helper.sh";
fi;


if [ -e "$LYCHEEJS_HELPER" ]; then

	cd $PROJECT_ROOT;
	tag=`git tag`;

	"$LYCHEEJS_HELPER" env:node ./bin/package-bower.js $tag;
	"$LYCHEEJS_HELPER" env:node ./bin/package-npm.js $tag;

# TODO: git push origin --tags
# TODO: bower publish, npm publish

fi;


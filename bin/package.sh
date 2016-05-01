#!/bin/bash


LYCHEEJS_ROOT="/opt/lycheejs";
PROJECT_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../"; pwd);


_build() {

	platform="$1";
	target="$PROJECT_ROOT/build/$platform/lychee.js";
	folder=$(dirname "$target");
	core="$LYCHEEJS_ROOT/libraries/lychee/build/$platform/core.js";
	dist="$LYCHEEJS_ROOT/libraries/lychee/build/$platform/dist/index.js";


	if [ ! -d "$folder" ]; then
		mkdir -p "$folder";
	fi;

	cat $core $dist > $target;
	echo -e "\n" >> $target;
	echo -e "lychee.inject(lychee.ENVIRONMENTS[\"/libraries/lychee/dist\"]);\n" >> $target;
	echo -e "lychee.environment.type  = \"build\";\n"                           >> $target;
	echo -e "lychee.environment.build = \"lychee.DIST\";\n"                     >> $target;

}


cd $LYCHEEJS_ROOT;

./bin/fertilizer.sh html/dist /libraries/lychee;
./bin/fertilizer.sh html-nwjs/dist /libraries/lychee;
./bin/fertilizer.sh html-webview/dist /libraries/lychee;
./bin/fertilizer.sh node/dist /libraries/lychee;
# ./bin/fertilizer.sh node-sdl/dist /libraries/lychee;


cd $PROJECT_ROOT;
rm -rf ./build;


_build html;
_build html-nwjs;
_build html-webview;
_build node;
# _build node-sdl;


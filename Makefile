VERSION=`cut -d '"' -f2 $BUILDDIR/../version.js`

cordova-base:
	grunt dist-mobile

wp8-prod:
	cordova/build.sh WP8 --clear
	cordova/wp/fix-svg.sh
	echo -e "\a"

wp8-debug:
	cordova/build.sh WP8 --dbgjs
	cordova/wp/fix-svg.sh
	echo -e "\a"

ios:
	cordova/build.sh IOS --dbgjs
	cd ../Exodusbuilds/project-IOS && cordova build ios
	open ../Exodusbuilds/project-IOS/platforms/ios/Exodus.xcodeproj

ios-prod:
	cordova/build.sh IOS --clear
	cd ../Exodusbuilds/project-IOS && cordova build ios

ios-debug:
	cordova/build.sh IOS --dbgjs
	cd ../Exodusbuilds/project-IOS && cordova build ios
	open ../Exodusbuilds/project-IOS/platforms/ios/Exodus.xcodeproj

android:
	cordova/build.sh ANDROID --dbgjs
	cd ../Exodusbuilds/project-ANDROID && cordova build android --release   2>&1 >/dev/null
	mv ../Exodusbuilds/project-ANDROID/platforms/android/build/outputs/apk/android-release-unsigned.apk ../Exodusbuilds/Exodus.apk

android-prod:
	cordova/build.sh ANDROID --clear
	cd ../Exodusbuilds/project-ANDROID && cordova build android 2>&1 >/dev/null
	mv ../Exodusbuilds/project-ANDROID/platforms/android/build/outputs/apk/android-debug.apk ../Exodusbuilds/Exodus.apk

android-prod-fast:
	cordova/build.sh ANDROID
#	cd ../Exodusbuilds/project-ANDROID && cordova run android --device
	cd ../Exodusbuilds/project-ANDROID && cordova build android 2>&1 >/dev/null
	mv ../Exodusbuilds/project-ANDROID/platforms/android/build/outputs/apk/android-debug.apk ../Exodusbuilds/Exodus.apk

android-debug:
	cordova/build.sh ANDROID --dbgjs
	cd ../Exodusbuilds/project-ANDROID && cordova build android 2>&1 >/dev/null
	mv ../Exodusbuilds/project-ANDROID/platforms/android/build/outputs/apk/android-debug.apk ../Exodusbuilds/Exodus.apk


android-debug-fast:
	cordova/build.sh ANDROID --dbgjs
	cd ../Exodusbuilds/project-ANDROID && cordova run android --device

win32:
	grunt.cmd desktop
	cp -rf node_modules ../Exodusbuilds/Exodus/win32/
	grunt.cmd inno32

win64:
	grunt.cmd inno64

linux64:
	grunt desktop
	cp -rf node_modules ../Exodusbuilds/Exodus/linux64/
	grunt linux64

osx64:
	grunt desktop
	cp -rf node_modules ../Exodusbuilds/Exodus/osx64/Exodus.app/Contents/Resources/app.nw/
	grunt dmg
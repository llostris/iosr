#!/bin/bash -e

function start {
        APP_NAME=$1
        rhc app create $APP_NAME diy-0.1 
        rhc cartridge add https://raw.githubusercontent.com/llostris/iosr/cartridge/metadata/manifest.yml -a $APP_NAME
	cd $APP_NAME
        cp ../manifest.yml .
	cp ../SparkPi.jar .
        git add manifest.yml SparkPi.jar
        git commit -m "init"
	git push origin master
	cd ..
}

function stop {
	APP_NAME=$1
	rm -fr $APP_NAME
	rhc app delete $APP_NAME --confirm
}


if [ -n $1 ]
then
	case "$2" in
		start)		start $1 ;;
		stop)		stop $1 ;;
		*)		echo "Invalid action provided"
				exit 0;;
	esac
else
	echo "No app name provided"
	exit 1
fi

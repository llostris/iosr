#!/bin/bash -e

DIRECTORY=$3

function create {
	APP_NAME=$1
	rhc app create $APP_NAME diy-0.1 
	rhc cartridge add https://raw.githubusercontent.com/llostris/iosr/cartridge/metadata/manifest.yml -a $APP_NAME
}

function run {
	if [ -z $DIRECTORY ]
	then
		echo "No directory provided"
		exit 1
	fi
	
	APP_NAME=$1
	cd $APP_NAME
	cp ../$DIRECTORY/manifest.yml .
	cp ../binaries/SparkPi.jar .
	cp ../binaries/wordcount.jar .
	git add .
	git commit -m "init"
	git push origin master
	cd ..
}		

function start {
	create $1
	run $1
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
		create)		create $1 ;;
		run)		run $1 ;;
		*)			echo "Invalid action provided"
		exit 0;;
	esac
else
	echo "No app name provided"
	exit 1
fi

#!/bin/bash

# start or stop or create off the shelf lts ubuntu image which is configured for docker
# all based on assumption that "multipass" from ubuntu is installed on mac

USAGE="Usage: mp.sh [--stop|--start]"

if [ $(which multipass) ]
then
	if [ ! "$(multipass list | grep ^docker)" ]
	then
		multipass launch docker

		if [ -d $HOME/Git ]
		then
			multipass mount $HOME/Git docker:/home/ubuntu/git
		fi
	fi

	multipass info docker

	if [ $# -gt 0 ]
	then
		case $1 in
		--stop)  multipass stop docker
		;;
		--start) multipass start docker
		;;
		esac

		multipass info docker
	fi

	echo -e "\n$USAGE"
else
	echo "WARN: executable multipass not installed, exiting..."
	exit 1
fi

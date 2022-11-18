#!/bin/bash

# start or stop or create off the shelf lts ubuntu image which is configured for docker
# all based on assumption that "multipass" from ubuntu is installed on mac

VM=$1
NM=${2:-$1}

if [ $(which multipass) ]
then
	if [ ! "$(multipass list | grep ^$VM)" ]
	then
		multipass launch --name $NM --mount $HOME $VM
	fi

	multipass info $NM
else
	echo "WARN: executable multipass not installed, exiting..."
	exit 1
fi

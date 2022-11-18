#!/bin/bash

# 2020-10-30
# instructions - install aws cli - linux
# ref - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions

if [ $(which aws) ]
then
	aws --version
	exit 0
fi

sudo apt-get update && sudo apt-get install -y unzip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo aws/install

rm -rf ./aws ./awscliv2.zip

aws --version

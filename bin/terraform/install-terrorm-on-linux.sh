#!/bin/bash

# 2020-10-30
# instructions - install terraform - linux
# ref: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
# Hashicorp fingerprint lifted from reference page

HASHICORPFP="E8A032E094D8EB4EA189D270DA418C88A3219F7B"

if [ $(which terraform) ]
then
	terraform -version
	exit 0
fi

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

FINGERPRINT=$(
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint \
    | egrep -v "[a-z-]|^$" | tr -d " " \
)

if [ $FINGERPRINT != $HASHICORPFP ]
then
	echo "FAIL: Unexpected fingerprint from Hashicorp"
	echo "      Expected: $HASHICORPFP"
	echo "      Received: $FINGERPRINT"
	echo "      Exiting..."
	exit 1
fi

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
     https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
     sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt-get install -y terraform

terraform -version


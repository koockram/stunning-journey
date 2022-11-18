# assume this can be run on mac host or linux guest
# do not export HOME

MYHOME=/Users/markcook

eval "$(ssh-agent -s)"
ssh-add $MYHOME/.ssh/koockram_github

#export AWS_PROFILE=default
#export AWS_CONFIG_FILE=$HOME/.aws/config
#export AWS_SHARED_CREDENTIALS_FILE=$HOME/.aws/credentials

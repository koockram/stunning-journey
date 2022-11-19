# assume this can be run on mac host or linux guest
# do not export HOME

MAC_HOME=/Users/markcook

eval "$(ssh-agent -s)"
ssh-add $MAC_HOME/.ssh/koockram_github
ssh-add -l

export AWS_PROFILE=default
export AWS_CONFIG_FILE=$MAC_HOME/.aws/config
export AWS_SHARED_CREDENTIALS_FILE=$MAC_HOME/.aws/credentials
#aws sts get-caller-identity

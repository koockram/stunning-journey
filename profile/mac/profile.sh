# assume this can be run on mac host
# do not export HOME

export MAC_HOME=/Users/$USER
export PROJ_BIN=$MAC_HOME/git/stunning-journey/bin

export PATH=$PATH:$PROJ_BIN

eval "$(ssh-agent -s)"
ssh-add $MAC_HOME/.ssh/github
ssh-add $MAC_HOME/.ssh/aws_key
ssh-add -l

alias ll='ls -al'
alias aws='aws-cli.sh'
alias terraform='terraform.sh'

alias tf='terraform'


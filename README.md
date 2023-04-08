# project stunning-journey
  
## podman & macbook pattern
  
\# install podman  
$ brew install podman
  
\# initialise podman machine and check home area mounted by default.  
$ podman machine init  
$ podman machine start  
  
\# import profile.  
$ . profile/mac/profile.sh  
  
\# install client images by running version commands with the files  
* bin/aws-cli.sh  
* bin/terraform.sh  
  mounts ~/.aws as /.aws  
  mounts ~/.ssh as /.ssh  
  mounts $(pwd) as /terraform  

  
$ aws --version  
$ terraform --version  


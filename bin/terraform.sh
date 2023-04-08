podman run --rm -it \
-v ~/.aws:/.aws \
-v ~/.ssh:/.ssh \
-e AWS_PROFILE=default \
-e AWS_CONFIG_FILE=/.aws/config \
-e AWS_SHARED_CREDENTIALS_FILE=/.aws/credentials \
-v $(pwd):/terraform \
-w /terraform \
docker.io/hashicorp/terraform "$@"

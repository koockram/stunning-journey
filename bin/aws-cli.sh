podman run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws docker.io/amazon/aws-cli --no-cli-pager "$@"

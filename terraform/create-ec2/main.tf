provider "aws" {
  region = "eu-west-2"
}

locals {
  ami_id = "ami-08d9bb4bfe39be5c2" # Replace this with the RHEL AMI ID available in the eu-west-2 region
}

variable "pub_ssh_key" {
  type        = string
  description = "My public ssh key"
  default     = "/.ssh/aws_key.pub"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default" {
  availability_zone = "eu-west-2a"
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("${var.pub_ssh_key}") # Replace with the path to your SSH public key
}

resource "aws_instance" "rhel_vm" {
  ami           = local.ami_id
  instance_type = "t2.micro"

  key_name = aws_key_pair.my_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  subnet_id = aws_default_subnet.default.id

  tags = {
    Name = "RHEL_VM"
  }
}


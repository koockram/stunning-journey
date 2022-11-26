provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "fred01" {
  ami           = "ami-0f540e9f488cfa27d"
  instance_type = "t2.micro"

  tags = {
    Name = "fred01"
  }
}

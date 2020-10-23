provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_instance" "my_ubuntu" {
  ami = "ami-06b263d6ceff0b3dd"
  instance_type = "t2.nano"
//  instance_type = "t2.micro"

  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "Serhii On"
    Project = "Terraform Lessons"
  }
}


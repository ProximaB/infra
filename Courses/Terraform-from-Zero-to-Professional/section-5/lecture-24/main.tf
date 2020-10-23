#----------------------------------------------------------
# My Terraform
#
# Terraform Loops: Count and For if
#
# Made by me
#----------------------------------------------------------

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_iam_user" "user1" {
  name = "Pushkin"
}

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name = element(var.aws_users, count.index)
}

#----------------------------------------------------------------

resource "aws_instance" "servers" {
  count = 0
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = "t2.nano"
  tags = {
    Name = "Server Number ${count.index + 1}"
  }
}


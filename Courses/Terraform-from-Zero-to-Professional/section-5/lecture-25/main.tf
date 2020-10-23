#----------------------------------------------------------
# My Terraform
#
# Provision Resources in Multiply AWS Regions / Accounts
#
# Made by me
#----------------------------------------------------------

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-east-1"
  alias = "us_east_virginia"
}

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-east-2"
  alias = "us_east_ohio"
}

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-west-1"
  alias = "us_west_california"
}

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-west-2"
  alias = "us_west_oregon"
}
#============================================================================

data "aws_ami" "us_east_virginia_latest_ubuntu" {
  provider = aws.us_east_virginia
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "us_east_ohio_latest_ubuntu" {
  provider = aws.us_east_ohio
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "us_west_california_latest_ubuntu" {
  provider = aws.us_west_california
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "us_west_oregon_latest_ubuntu" {
  provider = aws.us_west_oregon
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
#============================================================================

resource "aws_instance" "us_east_virginia_latest_ubuntu" {
  provider = aws.us_east_virginia
  ami = data.aws_ami.us_east_virginia_latest_ubuntu.id
  instance_type = "t2.nano"
  tags = {
    Name = "US East (N. Virginia) Server"
  }
}

resource "aws_instance" "us_east_ohio_latest_ubuntu" {
  provider = aws.us_east_ohio
  ami = data.aws_ami.us_east_ohio_latest_ubuntu.id
  instance_type = "t2.nano"
  tags = {
    Name = "US East (Ohio) Server"
  }
}

resource "aws_instance" "us_west_california_latest_ubuntu" {
  provider = aws.us_west_california
  ami = data.aws_ami.us_west_california_latest_ubuntu.id
  instance_type = "t2.nano"
  tags = {
    Name = "US West (N. California) Server"
  }
}

resource "aws_instance" "us_west_oregon_latest_ubuntu" {
  provider = aws.us_west_oregon
  ami = data.aws_ami.us_west_oregon_latest_ubuntu.id
  instance_type = "t2.nano"
  tags = {
    Name = "US West (Oregon) Server"
  }
}


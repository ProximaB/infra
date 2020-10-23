#----------------------------------------------------------
# My Terraform
#
# Terraform Conditions and Lookups
#
# Made by me
#----------------------------------------------------------

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-east-1"
}

// Use of Condition
resource "aws_instance" "my_webserver1" {
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
//  instance_type = (var.env == "prod" ? "t2.micro" : "t2.nano")
  instance_type = (var.env == "prod" ? var.ec2_size["prod"] : var.ec2_size["dev"])

  tags = {
    Name = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_onwer : var.noprod_owner
  }
}

// Use of LOOKUP
resource "aws_instance" "my_webserver2" {
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = lookup(var.ec2_size, var.env)

  tags = {
    Name = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_onwer : var.noprod_owner
  }
}

// Create Bastion ONLY for if "dev" environment
resource "aws_instance" "my_dev_bastion" {
  count = var.env == "dev" ? 1 : 0
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = "t2.nano"

  tags = {
    Name = "Bastion Server for Dev-server"
  }
}


resource "aws_security_group" "my_webserver" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = lookup(var.allow_port_list, var.env)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Dynamic SecurityGroup"
    Owner = var.prod_onwer
  }
}


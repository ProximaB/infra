#----------------------------------------------------------
# My Terraform
#
# Build WebServer during Bootstrap
#
# Made by me
#----------------------------------------------------------

provider "aws" {
  access_key = "AKIASBQXRYH7XSTQAAF6"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_instance" "my_server_web" {
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = "t2.nano"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Server-Web"
  }

  depends_on = [aws_instance.my_server_app, aws_instance.my_server_db]
}

resource "aws_instance" "my_server_app" {
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = "t2.nano"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Server-Application"
  }

  depends_on = [aws_instance.my_server_db]
}

resource "aws_instance" "my_server_db" {
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = "t2.nano"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Server-Database"
  }
}

resource "aws_security_group" "my_webserver" {
  name = "WebServer Security Group"
  description = "My First SecurityGroup"

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server SecurityGroup"
    Owner = "Serhii On"
  }
}


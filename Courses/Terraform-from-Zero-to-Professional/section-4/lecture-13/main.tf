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

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
}

resource "aws_instance" "my_webserver" {
  ami = "ami-00514a528eadbc95b" # Amazon Linux AMI
  instance_type = "t2.nano"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("./user_data.sh.tpl", {
    f_name = "Serhii",
    l_name = "On",
    names = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha", "Test"]
  })

  tags = {
    Name = "Web Server Build by Terraform"
    Owner = "Serhii On"
  }

  lifecycle {
//    prevent_destroy = true
//    ignore_changes = [ami, user_data]
//    create_before_destroy = true
  }

}

resource "aws_security_group" "my_webserver" {
  name = "WebServer Security Group"
  description = "My First SecurityGroup"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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


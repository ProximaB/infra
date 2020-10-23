variable "env" {
  type = string
  default = "dev"
}

variable "prod_onwer" {
  type = string
  default = "Serhii Onyshchenko"
}

variable "noprod_owner" {
  type = string
  default = "SerhiiOn"
}

variable "ec2_size" {
  default = {
    "dev" = "t3.micro"
    "staging" = "t2.small"
    "prod" = "t3.medium"
  }
}

variable "allow_port_list" {
  default = {
    "dev" = ["80", "443", "8080", "22"]
    "prod" = ["80", "443"]
  }
}

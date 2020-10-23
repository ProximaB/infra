variable "aws_users" {
  description = "List of IAM Users to create"
  type = list(string)
  default = ["vasya", "petya", "kolya", "lena", "masha", "misha", "vova", "donald"]
}


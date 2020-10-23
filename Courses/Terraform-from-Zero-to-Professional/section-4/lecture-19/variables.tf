variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "Enter Instance Type"
  type = string
  default = "t2.nano"
}

variable "allow_ports" {
  description = "List of Ports to open for server"
  type = list(string)
  default = ["80", "443", "22", "8080"]
}

variable "enable_detailed_monitoring" {
  type = bool
  default = false
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type = map(string, string)
  default = {
    Owner = "Serhii On"
    Project = "Phoenix"
    CostCenter = "12345"
    Environment = "development"
  }
}

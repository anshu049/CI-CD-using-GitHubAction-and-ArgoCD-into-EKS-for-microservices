variable "PROJECT_NAME" {
  default = "Jenkins"
}

variable "VPC_CIDR_BLOCK" {
  default = "10.0.0.0/16"
}

variable "AZ1" {
  default = "us-east-1a"
}

variable "AZ_CIDR_BLOCK" {
  default = "10.0.1.0/24"
}

variable "PORTS_EC2" {
  type    = list(number)
  default = [22, 8080]
}

variable "PUBLIC_KEY_PATH" {
  default = "~/.ssh/id_rsa.pub"
}

variable "PRIVATE_KEY_PATH" {
  default = "~/.ssh/id_rsa"
}

variable "EC2_USER" {
  default = "ubuntu"
}
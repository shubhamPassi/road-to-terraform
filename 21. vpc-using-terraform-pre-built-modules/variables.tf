variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "vpc_name" {
  default = "shubham-vpc"
}

variable "cidr_range" {
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets_names" {
  type    = list(string)
  default = ["shubham_private_subnets_1", "shubham_private_subnets_2", "shubham_private_subnets_3"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "public_subnets_names" {
  type    = list(string)
  default = ["shubham_public_subnets_1", "shubham_public_subnets_2", "shubham_public_subnets_3"]
}

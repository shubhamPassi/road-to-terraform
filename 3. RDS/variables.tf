variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "allocated_storage" {
  default = 10
}

variable "username" {
  default = "admin"
}

variable "password" {
  sensitive = true
}
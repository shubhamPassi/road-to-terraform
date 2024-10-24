variable "region" {
  default = "us-east-1"
}

variable "instance_count" {
  type = map(number)
  default = {
    "dev" = 1
    "uat" = 2
    "prod" = 4
  }
}

variable "ami" {
    type = map(string)
    default = {
      "dev" = "ami-04a81a99f5ec58529"
      "uat" = "ami-04a81a99f5ec58529"
      "prod" = "ami-04a81a99f5ec58529"
    }
}

variable "instance_type" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "uat" = "t2.medium"
    "prod" = "t2.large"
  }
}
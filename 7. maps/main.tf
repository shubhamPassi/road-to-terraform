terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

variable "region" {
  type = string
}

provider "aws" {
  region = var.region
}

variable "ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-066784287e358dad1"
    "us-east-2" = "ami-0e86e20dae9224db8"
  }
}

resource "aws_instance" "ec2" {
  ami           = lookup(var.ami, "us-east-1", "AMI not found")
  instance_type = "t2.micro"

  tags = {
    Name = "webserver"
    environment = "DEV"
  }
}
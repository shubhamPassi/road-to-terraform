terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

variable "instance_type" {
  type = list(string)
  default = [ "t2.micro", "t2.medium", "t2.large" ]
}

resource "aws_instance" "example" {
  count = length(var.instance_type)
  ami           = "ami-04a81a99f5ec58529"
  instance_type = element(var.instance_type, count.index)

  tags = {
    Name = "webserver-${count.index}"
  }
}

output "public_ips" {
  value = aws_instance.example[*].public_ip
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"  # This makes it clear that 'aws' means the official provider from HashiCorp.
    }
  }
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.instance_count
  tags = {
    Name = "webserver-${count.index}"
  }
}
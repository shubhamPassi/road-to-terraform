terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region = "us-east-1"
}

provider "aws" {
  # Configuration options
  alias = "us-east-2"
  profile = "default"
  region = "us-east-2"
}

resource "aws_instance" "web" {
  provider = aws
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "webserver"
    Env = "dev"
  }
}

resource "aws_instance" "db" {
  provider = aws.us-east-2
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "webserver"
    Env = "dev"
  }
}

module "vpc" {
  source = ""
  providers = {
    aws = aws.us-east-2
  }
}
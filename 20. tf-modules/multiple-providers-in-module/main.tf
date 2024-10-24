terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

provider "aws" {
  alias = "ue2"
  region = "us-east-2"
  profile = "default"
}

module "child_module_differnt_region" {
  source = "./modules/create_ec2"
  instance_type = "t2.micro"
  ami = "ami-09efc42336106d2f2"
  providers = {
    aws = aws.ue2
  }
}

module "child_module_same_region" {
  source = "./modules/create_ec2"
  instance_type = "t2.micro"
  ami = "ami-0182f373e66f89c85"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }

  backend "s3" {
    bucket = "shubham-statefile"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state-lock-file"
  }
}

provider "aws" {
    region = var.region
}
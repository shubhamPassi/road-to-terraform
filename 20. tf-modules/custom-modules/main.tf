provider "aws" {
  region = "us-east-1"
}

module "webserver" {
  source = "./modules/create_ec2"
  count = 2
}

output "public_ip" {
    value = module.webserver[*].ip
}
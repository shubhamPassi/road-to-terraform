module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"
  name = "shubham-vpc"
  cidr = ["10.0.0.0/16"]
  private_subnets = [ "10.0.0.0/24" ]
  azs = [ "us-east-1a" ]
  enable_nat_gateway = true
  single_nat_gateway = true
}

output "all_private_ips" {
    value = module.vpc.private_subnets
}
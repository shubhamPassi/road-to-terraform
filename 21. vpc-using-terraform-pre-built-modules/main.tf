data "aws_availability_zones" "available" {
  state = "available"
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name = var.vpc_name
  cidr = var.cidr_range

  azs                  = slice(data.aws_availability_zones.available.names, 0, 2) # slice(list, startindex, endindex)
  private_subnets      = var.private_subnets
  private_subnet_names = var.private_subnets_names
  public_subnets       = var.public_subnets
  public_subnet_names  = var.public_subnets_names

  private_subnet_tags = {
    subnet                            = "shubham-private-subnet"
    "kubernetes.io/role/internal-elb" = 1
  }

  public_subnet_tags = {
    subnet                   = "shubham-public-subnet"
    "kubernetes.io/role/elb" = 1
  }

  enable_nat_gateway = true
  enable_vpn_gateway = true

  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  map_public_ip_on_launch = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
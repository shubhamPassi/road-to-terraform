resource "aws_subnet" "private_01" {
  vpc_id            = aws_vpc.k8s_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                              = "private-01"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private_02" {
  vpc_id            = aws_vpc.k8s_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name                              = "private-02"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "public_01" {
  vpc_id            = aws_vpc.k8s_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                     = "public-01"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_02" {
  vpc_id            = aws_vpc.k8s_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name                     = "public-02"
    "kubernetes.io/role/elb" = "1"
  }
}
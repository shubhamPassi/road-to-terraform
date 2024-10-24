resource "aws_route_table" "k8s_private_rt" {
  vpc_id = aws_vpc.k8s_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.k8s_nat_gw.id
  }

  tags = {
    Name = "k8s_private_rt"
  }
}

resource "aws_route_table" "k8s_public_rt" {
  vpc_id = aws_vpc.k8s_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "k8s_public_rt"
  }
}

resource "aws_route_table_association" "private_subnet_rt_association_01" {
  subnet_id      = aws_subnet.private_01.id
  route_table_id = aws_route_table.k8s_private_rt.id
}

resource "aws_route_table_association" "private_subnet_rt_association_02" {
  subnet_id      = aws_subnet.private_02.id
  route_table_id = aws_route_table.k8s_private_rt.id
}

resource "aws_route_table_association" "public_subnet_rt_association_01" {
  subnet_id      = aws_subnet.public_01.id
  route_table_id = aws_route_table.k8s_public_rt.id
}

resource "aws_route_table_association" "public_subnet_rt_association_02" {
  subnet_id      = aws_subnet.public_02.id
  route_table_id = aws_route_table.k8s_public_rt.id
}
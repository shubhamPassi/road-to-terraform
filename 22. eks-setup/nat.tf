resource "aws_eip" "k8s_nat_eip" {
  tags = {
    "Name" = "k8s-nat-eip"
  }
}


resource "aws_nat_gateway" "k8s_nat_gw" {
  allocation_id = aws_eip.k8s_nat_eip.id
  subnet_id     = aws_subnet.public_01.id

  tags = {
    Name = "k8s-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
resource "aws_instance" "ec2" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = var.is_prod ? "t2.large" : "t2.micro"

  tags = {
    Name = "webserver"
    environment = var.is_prod ? "PROD" : "DEV"
  }
}
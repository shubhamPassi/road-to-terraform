resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.instance_count
  tags = {
    Name = "webserver-${count.index}"
  }
}
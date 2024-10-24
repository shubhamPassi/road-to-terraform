resource "aws_instance" "web" {
  count = lookup(var.instance_count, terraform.workspace, 1)
  ami             = lookup(var.ami, terraform.workspace, "ami-04a81a99f5ec58529")
  instance_type   = lookup(var.instance_type, terraform.workspace, "t2.micro")
  tags = {
    Name = "webserver-${terraform.workspace}-${count.index}"
  }
}
resource "aws_instance" "web" {
  count = 2
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "webserver-${count.index}"
    Env = "dev"
  }
}
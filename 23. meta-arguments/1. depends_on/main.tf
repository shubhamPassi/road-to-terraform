resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ "allow_ssh_http_sg" ]             # As we have hardcoded sercurity group. SG and EC2 will create in parallel so we are using depends_on here
  depends_on = [ aws_security_group.allow_ssh_http  ]

  tags = {
    Name = "webserver"
    Env = "dev"
  }
}
resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.allow_ssh_http.name ]
  key_name           = "aws-key"

  tags = {
    Name = "webserver"
  }
}
resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = "allow_ssh_http"
  depends_on = [ aws_security_group.allow_ssh_http ]

  tags = {
    Name = "webserver"
  }

  lifecycle {
    replace_triggered_by = [ aws_security_group.allow_ssh_http ]
  }
}
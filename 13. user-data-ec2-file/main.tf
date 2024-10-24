resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.key_info.key_name
  security_groups = [ aws_security_group.allow_http_ssh.name ]
  user_data = file("./assets/script.sh")

  tags = {
    Name = "webserver"
  }
}

output "url" {
    value = "http://${aws_instance.web.public_ip}"
}
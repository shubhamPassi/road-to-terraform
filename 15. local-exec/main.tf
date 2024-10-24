resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.key_info.key_name
  security_groups = [aws_security_group.ssh_http.name]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./assets/test-key")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "scp -i ~/.ssh/id_rsa ubuntu@${self.public_ip}:/etc/hosts ./"
    on_failure = fail
  }

  tags = {
    Name = "webserver"
  }
}


output "url" {
  value = "http://${aws_instance.web.public_ip}"
}
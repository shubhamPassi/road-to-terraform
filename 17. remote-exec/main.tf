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

  provisioner "file" {
    source = "./assets/init.sh"
    destination = "/tmp/init.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/init.sh",
      "sh /tmp/init.sh"
    ]
  }

  # provisioner "remote-exec" {
  #   inline = [ 
  #     "sudo apt update -y",
  #     "sudo apt install nginx -y",
  #     "sudo systemctl enable --now nginx"
  #   ]
  # }

  tags = {
    Name = "webserver"
  }
}


output "url" {
  value = "http://${aws_instance.web.public_ip}"
}
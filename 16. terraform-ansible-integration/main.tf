resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name
  security_groups = [ aws_security_group.ssh_http.name ]

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' ./assets/install-apache.yaml"
    on_failure = fail
  }

  tags = {
    Name = "HelloWorld"
  }
}

output "url" {
  value = "http://${aws_instance.web.public_ip}"
}
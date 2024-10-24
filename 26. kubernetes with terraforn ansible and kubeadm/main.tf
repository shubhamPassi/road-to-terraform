# Launch Master Node
resource "aws_instance" "k8s-master" {
  ami           = var.ami["master"]
  instance_type = var.instance_type["master"]

  key_name        = aws_key_pair.key_info.key_name
  security_groups = [aws_security_group.k8s_master.name]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./assets/k8s-key")
    host        = self.public_ip
  }

  provisioner "file" {
    source = "./assets/master.sh"
    destination = "/tmp/master.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/master.sh",
      "sudo sh /tmp/master.sh k8s-master"
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -vvv -i '${self.public_ip},' ./assets/copy-remote-to-local.yaml"
  }


  tags = {
    Name = "k8s-master"
  }
}

# Launch Worker Node
resource "aws_instance" "k8s-worker" {
  count = var.worker_instance_count

  ami           = var.ami["worker"]
  instance_type = var.instance_type["worker"]

  key_name        = aws_key_pair.key_info.key_name
  security_groups = [aws_security_group.k8s_worker.name]

  depends_on = [aws_instance.k8s-master]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./assets/k8s-key")
    host        = self.public_ip
  }

  provisioner "file" {
    content     = "./assets/worker.sh"
    destination = "/tmp/worker.sh"
  }

  provisioner "file" {
    content     = "./assets/join-command.sh"
    destination = "/tmp/join-command.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/worker",
      "sh /tmp/worker.sh k8s-worker-${count.index}",
      "sudo sh /tmp/join-command.sh"
    ]
  }

  tags = {
    Name = "k8s-worker-${count.index}"
  }
}
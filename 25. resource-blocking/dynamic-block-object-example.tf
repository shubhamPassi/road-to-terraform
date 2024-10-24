variable "inbound_ports" {
  description = "Ports for ingress rules"
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    {
      description = "port for ssh"
      port        = 22
    },
    {
      description = "port for http"
      port        = 80
    },
    {
      description = "port for https"
      port        = 433
    }
  ]
}

variable "outbound_ports" {
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    {
      description = "port for http"
      port        = 80
    },
    {
      description = "port for https"
      port        = 433
    }
  ]
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Inbound allow port 22, 80 and 443, outbound allow port 80 and 443"

  dynamic "ingress" {
    for_each = var.inbound_ports
    iterator = ingress_data # If we dont define iterator then we need to use name of dynamic block i.e "ingress" in this case to iterate over inbound ports. iterator works as a alias
    content {
      description      = ingress_data.value.description
      from_port        = ingress_data.value.port
      to_port          = ingress_data.value.port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  dynamic "egress" {
    for_each = var.outbound_ports
    iterator = egress_data
    content {
      description      = egress_data.value.description
      from_port        = egress_data.value.port
      to_port          = egress_data.value.port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  tags = {
    Name = "allow_ssh_http"
  }
}
# variable "inbound_ports" {
#   type    = list(number)
#   default = [22, 80, 433]
# }

# variable "outbound_ports" {
#   type    = list(number)
#   default = [80, 443]
# }

# resource "aws_security_group" "allow_ssh_http" {
#   name        = "allow_ssh_http"
#   description = "Inbound allow port 22, 80 and 443, outbound allow port 80 and 443"

#   dynamic "ingress" {
#     for_each = var.inbound_ports
#     content {
#       description      = "Allow port ${ingress.value}"
#       from_port        = ingress.value
#       to_port          = ingress.value
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#     }
#   }

#   dynamic "egress" {
#     for_each = var.outbound_ports
#     content {
#       description      = "Allow port ${egress.value}"
#       from_port        = egress.value
#       to_port          = egress.value
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#     }
#   }

#   tags = {
#     Name = "allow_ssh_http"
#   }
# }
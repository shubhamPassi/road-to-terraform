resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow port 22 and 80"

  ingress {
    description = "Allow SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }

  ingress {
    description = "Allow HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port       = 0               # allow all the ports
    to_port         = 0               # allow all the ports
    protocol        = "-1"            # allow all protocols
    cidr_blocks     = ["0.0.0.0/0"]   # allow all ipv4 ips
    ipv6_cidr_blocks = ["::/0"]       # allow all ipv6 ips
  }

  tags = {
    Name = "allow_tls"
  }
}
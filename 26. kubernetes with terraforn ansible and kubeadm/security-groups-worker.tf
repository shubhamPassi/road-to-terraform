resource "aws_security_group" "k8s_worker" {
  name        = "k8s_worker_sg"
  description = "K8s Worker security group"

  tags = {
    Name = "k8s_worker_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_worker" {
  description       = "ssh"
  security_group_id = aws_security_group.k8s_worker.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "weavenet_tcp_worker" {
  description       = "Weavenet TCP"
  security_group_id = aws_security_group.k8s_worker.id
  from_port         = 6783
  to_port           = 6783
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "weavenet_udp_worker" {
  description       = "Weavenet TCP"
  security_group_id = aws_security_group.k8s_worker.id
  from_port         = 6784
  to_port           = 6784
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "kubelet_worker" {
  description       = "kube-api, kube-scheduler, kube-controler-manager, Read-only kubelet api and kubelet health."
  security_group_id = aws_security_group.k8s_worker.id
  from_port         = 10248
  to_port           = 10260
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "nodeport_services_worker" {
  description       = "Nodeport Services"
  security_group_id = aws_security_group.k8s_worker.id
  from_port         = 30000
  to_port           = 32767
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_worker" {
  security_group_id = aws_security_group.k8s_worker.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
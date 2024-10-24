resource "aws_security_group" "k8s_master" {
  name        = "k8s_master_sg"
  description = "K8s Master security group"

  tags = {
    Name = "k8s_master_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_master" {
  description       = "ssh"
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "api_server_master" {
  description       = "API Server"
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 6443
  to_port           = 6443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "etcd_server_client_api_master" {
  description       = "ETCD Server Client API"
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 2379
  to_port           = 2380
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "weavenet_tcp_master" {
  description       = "Weavenet TCP"
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 6783
  to_port           = 6783
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "weavenet_udp_master" {
  description       = "Weavenet TCP"
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 6784
  to_port           = 6784
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "kubelet_master" {
  description       = "kube-api, kube-scheduler, kube-controler-manager, Read-only kubelet api and kubelet health."
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 10248
  to_port           = 10260
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "nodeport_services_master" {
  description       = "Nodeport Services"
  security_group_id = aws_security_group.k8s_master.id
  from_port         = 30000
  to_port           = 32767
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_master" {
  security_group_id = aws_security_group.k8s_master.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
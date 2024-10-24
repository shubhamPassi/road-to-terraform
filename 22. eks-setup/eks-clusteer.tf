resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.k8s_cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.private_01.id, aws_subnet.private_02.id, aws_subnet.public_01.id, aws_subnet.public_02.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [aws_iam_role_policy_attachment.k8s_policy_attach]
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
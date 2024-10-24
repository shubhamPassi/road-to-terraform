resource "aws_eks_node_group" "eks_managed_nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-managed-nodes"
  node_role_arn   = aws_iam_role.k8s_node_role.arn
  subnet_ids      = [aws_subnet.private_01.id, aws_subnet.private_02.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ec2_container_registery_readolny_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_worker_node_policy,
  ]
}
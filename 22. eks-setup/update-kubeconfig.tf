resource "null_resource" "kubeconfig" {
  depends_on = [ aws_eks_cluster.eks_cluster ]
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.region} --name ${var.cluster_name}"
    when = create
  }
}
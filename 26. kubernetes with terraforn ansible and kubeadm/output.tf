output "master" {
  value = aws_instance.k8s-master.public_ip
}

# output "worker" {
#   value = aws_instance.k8s-worker[*].public_ip
# }
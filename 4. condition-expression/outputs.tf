output "instance_type" {
  value = aws_instance.ec2.instance_type
}

output "environment" {
  value = aws_instance.ec2.tags.environment
}
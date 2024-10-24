variable "instance_type" {
  type = set(string)
  default = [ "t2.micro", "t2.medium", "t2.large" ]
}

output "instance_type" {
  value = tolist(var.instance_type)[0]
}
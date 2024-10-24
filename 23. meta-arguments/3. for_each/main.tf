########## Using Map ################
variable "instance_types_using_map" {
  type = map(string)
  default = {
    master = "t2.medium"
    worker-01 = "t2.micro"
    worker-02 = "t2.micro"
  }
}

resource "aws_instance" "webserver_using_map" {
  for_each = var.instance_types_using_map
  ami = "ami-04a81a99f5ec58529"
  instance_type = each.value
  tags = {
    Name = "k8s-using-map-${each.value}"
  }
}

########## Using set ################
variable "instance_types_using_set" {
  type = list(string)
  default = [ "t2.medium", "t2.micro", "t2.micro" ]
}

resource "aws_instance" "webserver_using_set" {
  for_each = toset( var.instance_types_using_set )
  ami = "ami-04a81a99f5ec58529"
  instance_type = each.value
  tags = {
    Name = "k8s-using-set-${each.value}"
  }
}

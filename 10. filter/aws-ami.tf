data "aws_ami" "example" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["*ami-2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "filtered_images" {
    value = data.aws_ami.example.id
}
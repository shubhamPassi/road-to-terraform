 resource "aws_instance" "example" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key-pair.key_name

  tags = {
    Name = "webserver"
  }
}
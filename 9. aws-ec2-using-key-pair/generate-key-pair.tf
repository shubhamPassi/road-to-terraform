terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

##### This can be used to generete key pair
# resource "aws_key_pair" "deployer" {
#   key_name   = "aws-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBMbL4mNUUr0mOwVD/1dwqVzBQ/VymKr5AtiLX+vMp5yDeYm+rSGocIPAlHrlu/LqT0xK7rEDe04bEdNyLYGE4UZAvJ+KXgxLiEbzzNKwCU+8c6F7ayR0cPTadW8WFn6pxgBVsFMh5orMzn48n1UgycQPs5rFkWAITwlx0MksRmURkHGhy7NazexLNPjFmalDx6OsFnl2NjlSmnv2bwx3FV3DKEITTxirAva/VeAXGmPKgrhb6yn1JX4VAtR+vx15V9V3BDvwcVOX09QIeaMDsPuWG2EsJJ7ASwiV4/RdC2cYHuqciFx7frsTu4Yo/USnsZ03boByxoyJwOs+047J8O7SyTN/1Z1Z+Glzl2PZ9nUnJ9gpr2nEYOD5Pui74MSSFHgRNGQYIqVEkaMNcBqdpZq254/dl/VzDbZNWJMJKXAltQffFoZjM4q3y9VVIj91CYIHuuFvKpJVNHje4gAkA0BZEIUGMA4NCQpTiezjIKzeEfESI/Fe07bSuvfUjRGk= legion@LAPTOP-LRMS9O5D"
# }

data "aws_key_pair" "key-pair" {
  key_name           = "aws-key"
}


resource "aws_instance" "example" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.key-pair.key_name

  tags = {
    Name = "webserver"
  }
}
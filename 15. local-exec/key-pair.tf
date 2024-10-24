resource "aws_key_pair" "key_info" {
  key_name   = "deployer-key"
  public_key = file("./assets/test-key.pub")
}

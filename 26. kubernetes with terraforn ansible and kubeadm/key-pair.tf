resource "aws_key_pair" "key_info" {
  key_name   = "k8s-key"
  public_key = file("./assets/k8s-key.pub")
}
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "./foo.bar"
}

resource "local_sensitive_file" "foo" {
  content  = "foo!"
  filename = "./secret.bar"
}
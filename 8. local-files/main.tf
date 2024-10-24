terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

provider "local" {
}

data "local_file" "script" {
  filename = "${path.module}/script.sh"
}

output "script_content" {
	value	= data.local_file.script.content
}
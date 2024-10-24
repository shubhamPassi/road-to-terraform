terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

resource "random_pet" "server" {
    length = 1
    separator = "%-%"
    prefix = "test"
}

output "random_pet" {
  value = random_pet.server.id
}
##########
# OUTPUT #
##########


# PS D:\practice\terraform practice\terraform practice\0.2 Random-provider> terraform apply
# random_pet.server: Creation complete after 0s [id=test%-%opossum]
# Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
# Outputs:
# random_pet = "test%-%opossum"


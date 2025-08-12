terraform {
  required_version = ">= 1.7.5"
}

provider "null" {}

resource "null_resource" "example" {
  triggers = {
    environment = "dev"
  }

  provisioner "local-exec" {
    command = "echo 'Hello Policy Check'"
  }
}

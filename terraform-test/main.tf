terraform {
  required_version = ">= 1.7.5"
}

provider "null" {}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Hello Policy Check'"
  }

  # Tags for conftest policy to pass
  tags = {
    environment = "dev"
  }
}

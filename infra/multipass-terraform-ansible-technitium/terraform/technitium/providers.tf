terraform {
  required_providers {
    technitium = {
      source = "registry.terraform.io/darkhonor/technitium"
    }
  }
}

provider "technitium" {
  server_url      = var.technitium_server_url
  api_token       = var.TECHNITIUM_API_TOKEN
  skip_tls_verify = false
}
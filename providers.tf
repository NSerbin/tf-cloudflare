terraform {
  required_version = ">= 1.12.2"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.7.0"
    }
  }

  backend "pg" {}
}
provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}

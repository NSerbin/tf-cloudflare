terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.50.0"
    }
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}
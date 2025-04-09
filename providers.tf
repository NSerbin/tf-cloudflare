terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.3.0"
    }
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}
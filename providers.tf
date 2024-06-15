terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
<<<<<<< HEAD
      version = "4.39.0"
=======
      version = "4.35.0"
>>>>>>> 3739e5d (feat: adding ssh)
    }
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
<<<<<<< HEAD
      version = "5.18.0"
=======
      version = "5.20.0"
>>>>>>> 6fb438b (Adding github actions runner)
    }
  }

  backend "pg" {
    schema_name = "cloudflare"
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}

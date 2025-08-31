terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.4"
    }
  }
  backend "pg" {
    conn_str = "postgres://localhost:5433/terraform_backend?sslmode=disable"   
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.4"
    }
  }

  backend "pg" {
    conn_str = "postgres://${BACKEND_USER}:${BACKEND_PASSWORD}@$192.168.0.4:5432/terraform_backend?sslmode=disable" 
  }

}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}

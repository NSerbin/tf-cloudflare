terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.6.0"
    }
  }

  backend "pg" {
    conn_str = "postgres://${{ secrets.BACKEND_USER }}:${{ secrets.BACKEND_PASSWORD }}@localhost:5433/${{ secrets.BACKEND_DB }}?sslmode=disable"
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}

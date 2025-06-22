terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.6.0"
    }
  }

  backend "pg" {
    conn_str = "postgres://${{ secrets.TF_BACKEND_USER }}:${{ secrets.TF_BACKEND_PASS }}@localhost:5433/${{ secrets.TF_BACKEND_DB }}?sslmode=disable"    
  }
}

provider "cloudflare" {
  # Configuration options
  api_token = var.accounts_settings["cloudflare_api_token"]
}

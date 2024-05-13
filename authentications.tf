## Google SSO Login Method

resource "cloudflare_access_identity_provider" "google_sso" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.google_sso["name"]
  type       = var.google_sso["type"]
  config {
    client_id     = var.google_sso["client_id"]
    client_secret = var.google_sso["client_secret"]
  }
}

## GitHub OAuth Login Method
resource "cloudflare_access_identity_provider" "github_oauth" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.github_sso["name"]
  type       = var.github_sso["type"]
  config {
    client_id     = var.github_sso["client_id"]
    client_secret = var.github_sso["client_secret"]
  }
}

## One Time PIN Login Method
resource "cloudflare_access_identity_provider" "pin_login" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = "One-time PIN"
  type       = "onetimepin"
}

## Google SSO Login Method

resource "cloudflare_zero_trust_access_identity_provider" "google_sso" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.google_sso["name"]
  type       = var.google_sso["type"]
  config {
    client_id     = var.google_sso["client_id"]
    client_secret = var.google_sso["client_secret"]
  }
}

## GitHub OAuth Login Method
resource "cloudflare_zero_trust_access_identity_provider" "github_oauth" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.github_sso["name"]
  type       = var.github_sso["type"]
  config {
    client_id     = var.github_sso["client_id"]
    client_secret = var.github_sso["client_secret"]
  }
}

## One Time PIN Login Method
resource "cloudflare_zero_trust_access_identity_provider" "pin_login" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = "One-time PIN"
  type       = "onetimepin"
}

## Default Bypass Policy
resource "cloudflare_zero_trust_access_policy" "default_policy_bypass" {
  account_id = "12469faab013054ca9a6d78bcf71b9b2"
  name       = "Bypass Policy"
  decision   = "bypass"

  include {
    everyone = true
  }
}

## Default Access Group Policy
resource "cloudflare_zero_trust_access_policy" "default_policy_access_group" {
  account_id = "12469faab013054ca9a6d78bcf71b9b2"
  name       = "Default Policy"
  decision   = "allow"

  include {
    group = ["${cloudflare_zero_trust_access_group.raspbery_pi_tunnel_access_group.id}"]
  }
}

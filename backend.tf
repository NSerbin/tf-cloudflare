## Backend App
resource "cloudflare_access_application" "backend_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.backend["name"]
  domain                     = var.backend["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
}

## Backend Policy
resource "cloudflare_access_policy" "backend_policy_bypass" {
  application_id = cloudflare_access_application.backend_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Bypass Policy"
  precedence     = "1"
  decision       = "bypass"

  include {
    everyone = true
  }
}

## Record for Backend
resource "cloudflare_record" "backend_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.backend["name"]
  value   = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}
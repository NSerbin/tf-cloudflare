## n8n App
resource "cloudflare_zero_trust_access_application" "n8n_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.n8n["name"]
  domain                     = var.n8n["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_zero_trust_access_identity_provider.google_sso.id}", "${cloudflare_zero_trust_access_identity_provider.github_oauth.id}"]
  policies                   = [cloudflare_zero_trust_access_policy.default_policy_access_group.id, cloudflare_zero_trust_access_policy.default_policy_bypass.id]
  logo_url                   = var.n8n["logo_url"]
}

## Record for n8n
resource "cloudflare_record" "n8n_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.n8n["name"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}

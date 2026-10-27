resource "cloudflare_zero_trust_access_application" "scrutiny_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.scrutiny["name"]
  domain                     = var.scrutiny["domain"]
  type                       = var.k3s_cluster_tunnel["type"]
  session_duration           = var.k3s_cluster_tunnel["session_duration"]
  auto_redirect_to_identity  = var.k3s_cluster_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  enable_binding_cookie      = true
  allowed_idps               = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
  logo_url                   = var.scrutiny["logo_url"]
  policies                   = [local.default_access_policy]
  destinations               = [{ type = "public", uri = var.scrutiny["domain"] }]
  options_preflight_bypass   = false

  lifecycle {
    ignore_changes = [logo_url]
  }
}

resource "cloudflare_dns_record" "scrutiny_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.scrutiny["domain"]
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]
}

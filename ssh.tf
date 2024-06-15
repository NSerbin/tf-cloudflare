## SSH App
resource "cloudflare_access_application" "ssh_tunnel_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.ssh["name"]
  domain                     = var.ssh["domain"]
  type                       = var.ssh["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
}

## SSH Policy
resource "cloudflare_access_policy" "ssh_tunnel_policy_default" {
  application_id = cloudflare_access_application.ssh_tunnel_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Default Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    group = ["${cloudflare_access_group.raspbery_pi_tunnel_access_group.id}"]
  }
}

resource "cloudflare_access_ca_certificate" "ssh_tunnel_cert" {
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  application_id = cloudflare_access_application.ssh_tunnel_app.id
}

## Record for SSH
resource "cloudflare_record" "ssh_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.ssh["name"]
  value   = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}
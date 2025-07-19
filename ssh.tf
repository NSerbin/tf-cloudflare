## SSH App
resource "cloudflare_zero_trust_access_application" "ssh_tunnel_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.ssh["name"]
  domain                     = var.ssh["domain"]
  type                       = var.ssh["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  allowed_idps               = ["${cloudflare_zero_trust_access_identity_provider.google_sso.id}", "${cloudflare_zero_trust_access_identity_provider.github_oauth.id}"]
  options_preflight_bypass   = false


  policies = [
    {
      name       = "Default Policy"
      precedence = 1
      decision   = "allow"
      include = [{
        group = {
          id = "${cloudflare_zero_trust_access_group.raspbery_pi_tunnel_access_group.id}"
        }
      }]
    }
  ]

  destinations = [
    {
      type = "public"
      uri  = "${var.ssh["domain"]}"
    }
  ]
}

resource "cloudflare_zero_trust_access_short_lived_certificate" "ssh_tunnel_cert" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  app_id  = cloudflare_zero_trust_access_application.ssh_tunnel_app.id
}

## Record for SSH
resource "cloudflare_dns_record" "ssh_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.ssh["name"]}.${var.nserbin_website["domain"]}"
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]

}
## Bitwarden App Access
resource "cloudflare_zero_trust_access_application" "bitwarden_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.bitwarden["name"]
  domain                     = var.bitwarden["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = []
  policies = [
    {
      name       = "Bypass Policy"
      precedence = 1
      decision   = "bypass"
      include = [{
        everyone = {}
      }]
      require = []
      exclude = []
    }
  ]

  logo_url                 = var.bitwarden["logo_url"]
  options_preflight_bypass = false

  destinations = [
    {
      type = "public"
      uri  = var.bitwarden["domain"]
    },
    {
      type = "public"
      uri  = var.bitwarden["admin_domain"]
    },
  ]
}

## Record for Bitwarden
resource "cloudflare_dns_record" "bitwarden_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.bitwarden["prefix"]}.${var.nserbin_website["domain"]}"
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]

}

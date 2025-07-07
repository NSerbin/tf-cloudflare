## Backend App Access
resource "cloudflare_zero_trust_access_application" "backend_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.backend["name"]
  domain                     = var.backend["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  options_preflight_bypass   = false
  policies = [
    {
      name       = "Bypass Policy"
      id         = cloudflare_zero_trust_access_policy.default_policy_bypass.id
      precedence = 1
      decision   = "bypass"
      include = [{
        everyone = {}
      }]
    }
  ]

  destinations = [
    {
      type = "public"
      uri  = "tf-backend.nserbin.com"
    }
  ]
}

## Record for Backend
resource "cloudflare_dns_record" "backend_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.backend["name"]}.${var.nserbin_website["domain"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
  settings = {
    flatten_cname = false
  }
}
## AppFlowy App Access
resource "cloudflare_zero_trust_access_application" "appflowy_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.appflowy["name"]
  domain                     = var.appflowy["domain"]
  type                       = var.k3s_cluster_tunnel["type"]
  session_duration           = var.k3s_cluster_tunnel["session_duration"]
  auto_redirect_to_identity  = var.k3s_cluster_tunnel["auto_redirect_to_identity"]
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

  options_preflight_bypass = false

  destinations = [
    {
      type = "public"
      uri  = var.appflowy["domain"]
    }
  ]
}

## Record for AppFlowy
resource "cloudflare_dns_record" "appflowy_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.appflowy["domain"]
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]
}

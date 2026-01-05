## Authentik App
resource "cloudflare_zero_trust_access_application" "authentik_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.authentik["name"]
  domain                     = var.authentik["domain"]
  type                       = var.k3s_cluster_tunnel["type"]
  session_duration           = var.k3s_cluster_tunnel["session_duration"]
  auto_redirect_to_identity  = var.k3s_cluster_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = false
  allowed_idps               = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
  options_preflight_bypass   = false
  enable_binding_cookie      = true

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

  destinations = [
    {
      type = "public"
      uri  = var.authentik["domain"]
    }
  ]
  logo_url = var.authentik["logo_url"]
}

## Record for authentik
resource "cloudflare_dns_record" "authentik_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.authentik["domain"]
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]

}

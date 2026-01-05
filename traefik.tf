## Traefik App
resource "cloudflare_zero_trust_access_application" "traefik_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.traefik["name"]
  domain                     = var.traefik["domain"]
  type                       = var.k3s_cluster_tunnel["type"]
  session_duration           = var.k3s_cluster_tunnel["session_duration"]
  auto_redirect_to_identity  = var.k3s_cluster_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
  options_preflight_bypass   = false
  enable_binding_cookie      = true

  policies = [
    {
      name       = "Default Policy"
      precedence = 1
      decision   = "allow"
      include = [{
        group = {
          id = cloudflare_zero_trust_access_group.raspberry_pi_tunnel_access_group.id
        }
      }]
    }
  ]

  destinations = [
    {
      type = "public"
      uri  = var.traefik["domain"]
    }
  ]
  #logo_url = var.traefik["logo_url"]
}

## Record for traefik
resource "cloudflare_dns_record" "traefik_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.traefik["name"]}.${var.nserbin_website["domain"]}"
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]

}
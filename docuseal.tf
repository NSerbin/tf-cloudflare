resource "cloudflare_access_application" "docuseal_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.docuseal["name"]
  domain                     = var.docuseal["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
#  logo_url                   = var.docuseal["logo_url"]
}

resource "cloudflare_access_policy" "docuseal_policy_default" {
  application_id = cloudflare_access_application.docuseal_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Default Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    group = ["${cloudflare_access_group.raspbery_pi_tunnel_access_group.id}"]
  }
}

# ## docuseal Bypass Policy
# resource "cloudflare_access_policy" "docuseal_policy_bypass" {
#   application_id = cloudflare_access_application.docuseal_app.id
#   zone_id        = cloudflare_zone.nserbin_website_zone.id
#   name           = "Bypass Policy"
#   precedence     = "1"
#   decision       = "bypass"

#   include {
#     everyone = true
#   }
# }

## Record for docuseal
resource "cloudflare_record" "docuseal_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.docuseal["name"]
  value   = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}
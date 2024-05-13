resource "cloudflare_access_application" "freshrss_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.freshrss["name"]
  domain                     = var.freshrss["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
  logo_url                   = var.freshrss["logo_url"]
}

resource "cloudflare_access_policy" "freshrss_policy_default" {
  application_id = cloudflare_access_application.freshrss_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Default Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    group = ["${cloudflare_access_group.raspbery_pi_tunnel_access_group.id}"]
  }
}
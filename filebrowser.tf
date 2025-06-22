## FileBrowser App
resource "cloudflare_zero_trust_access_application" "filebrowser_app" {
  zone_id                      = cloudflare_zone.nserbin_website_zone.id
  name                         = var.filebrowser["name"]
  domain                       = var.filebrowser["domain"]
  type                         = var.raspberry_pi_tunnel["type"]
  session_duration             = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity    = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute   = false
  allowed_idps                 = ["${cloudflare_zero_trust_access_identity_provider.google_sso.id}", "${cloudflare_zero_trust_access_identity_provider.github_oauth.id}"]
  options_preflight_bypass     = false
  skip_app_launcher_login_page = false
  path_cookie_attribute        = false
  policies = [
    {
      name       = "Default Policy"
      id         = cloudflare_zero_trust_access_policy.default_policy_access_group.id
      precedence = 1
      decision   = "allow"
      include = [{
        group = {
          id = "${cloudflare_zero_trust_access_group.raspbery_pi_tunnel_access_group.id}"
        }
      }]
    }
  ]

  self_hosted_domains = ["vault.nserbin.com"]

  destinations = [
    {
      type = "public"
      uri  = "vault.nserbin.com"
    }
  ]
  logo_url = var.filebrowser["logo_url"]
}

## Record for FileBrowser
resource "cloudflare_dns_record" "filebrowser_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.filebrowser["prefix"]}.${var.nserbin_website["domain"]}"
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
  settings = {
    flatten_cname = false
  }
}

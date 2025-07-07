## Grafana App
resource "cloudflare_zero_trust_access_application" "grafana_app" {
  zone_id                      = cloudflare_zone.nserbin_website_zone.id
  name                         = var.grafana["name"]
  domain                       = var.grafana["domain"]
  type                         = var.raspberry_pi_tunnel["type"]
  session_duration             = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity    = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute   = true
  allowed_idps                 = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
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
          id = cloudflare_zero_trust_access_group.raspbery_pi_tunnel_access_group.id
        }
      }]
    }
  ]

  destinations = [
    {
      type = "public"
      uri  = "monitor.nserbin.com"
    }
  ]
  logo_url = var.grafana["logo_url"]
}

## Record for Grafana
resource "cloudflare_dns_record" "grafana_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.grafana["prefix"].var.nserbin_website["domain"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}

## CAdvisor App
resource "cloudflare_zero_trust_access_application" "cadvisor_app" {
  zone_id                      = cloudflare_zone.nserbin_website_zone.id
  name                         = var.cadvisor["name"]
  domain                       = var.cadvisor["domain"]
  type                         = var.raspberry_pi_tunnel["type"]
  session_duration             = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity    = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute   = true
  allowed_idps                 = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
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
          id = cloudflare_zero_trust_access_group.raspbery_pi_tunnel_access_group.id
        }
      }]
    }
  ]

  destinations = [
    {
      type = "public"
      uri  = "cadvisor.nserbin.com"
    }
  ]
  logo_url = var.cadvisor["logo_url"]
}

## Record for CADvisor
resource "cloudflare_dns_record" "cadvisor_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.cadvisor["name"]}.${var.nserbin_website["domain"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}

## Prometheus App
resource "cloudflare_zero_trust_access_application" "prometheus_app" {
  zone_id                      = cloudflare_zone.nserbin_website_zone.id
  name                         = var.prometheus["name"]
  domain                       = var.prometheus["domain"]
  type                         = var.raspberry_pi_tunnel["type"]
  session_duration             = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity    = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute   = true
  allowed_idps                 = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
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
          id = cloudflare_zero_trust_access_group.raspbery_pi_tunnel_access_group.id
        }
      }]
    }
  ]

  destinations = [
    {
      type = "public"
      uri  = "prometheus.nserbin.com"
    }
  ]
  logo_url = var.prometheus["logo_url"]
}


## Record for Prometheus
resource "cloudflare_dns_record" "prometheus_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.prometheus["name"].var.nserbin_website["domain"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
  settings = {
    flatten_cname = false
  }
}
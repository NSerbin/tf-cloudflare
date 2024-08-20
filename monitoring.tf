## Grafana App
resource "cloudflare_access_application" "grafana_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.grafana["name"]
  domain                     = var.grafana["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
  logo_url                   = var.grafana["logo_url"]
}

## Grafana Policy
resource "cloudflare_access_policy" "grafana_policy_default" {
  application_id = cloudflare_access_application.grafana_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Default Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    group = ["${cloudflare_access_group.raspbery_pi_tunnel_access_group.id}"]
  }
}

## Record for Grafana
resource "cloudflare_record" "grafana_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.grafana["prefix"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}

## CAdvisor App
resource "cloudflare_access_application" "cadvisor_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.cadvisor["name"]
  domain                     = var.cadvisor["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
  logo_url                   = var.cadvisor["logo_url"]
}

## CAdvisor Policy
resource "cloudflare_access_policy" "cadvisor_policy_default" {
  application_id = cloudflare_access_application.cadvisor_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Default Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    group = ["${cloudflare_access_group.raspbery_pi_tunnel_access_group.id}"]
  }
}

## Record for CADvisor
resource "cloudflare_record" "cadvisor_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.cadvisor["name"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}

## Prometheus App
resource "cloudflare_access_application" "prometheus_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.prometheus["name"]
  domain                     = var.prometheus["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
  logo_url                   = var.prometheus["logo_url"]
}

## Prometheus Policy
resource "cloudflare_access_policy" "prometheus_policy_default" {
  application_id = cloudflare_access_application.prometheus_app.id
  zone_id        = cloudflare_zone.nserbin_website_zone.id
  name           = "Default Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    group = ["${cloudflare_access_group.raspbery_pi_tunnel_access_group.id}"]
  }

}

## Record for Prometheus
resource "cloudflare_record" "prometheus_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.prometheus["name"]
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}
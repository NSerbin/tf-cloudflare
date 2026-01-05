## Grafana App
resource "cloudflare_zero_trust_access_application" "grafana_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.grafana["name"]
  domain                     = var.grafana["domain"]
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
      uri  = var.grafana["domain"]
    }
  ]
  logo_url = var.grafana["logo_url"]
}

## Record for Grafana
resource "cloudflare_dns_record" "grafana_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.grafana["domain"]
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]
}

## CAdvisor App
resource "cloudflare_zero_trust_access_application" "cadvisor_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.cadvisor["name"]
  domain                     = var.cadvisor["domain"]
  type                       = var.raspberry_pi_tunnel["type"]
  session_duration           = var.raspberry_pi_tunnel["session_duration"]
  auto_redirect_to_identity  = var.raspberry_pi_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
  options_preflight_bypass   = false

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
      uri  = var.cadvisor["domain"]
    }
  ]
  logo_url = var.cadvisor["logo_url"]
}

## Record for CADvisor
resource "cloudflare_dns_record" "cadvisor_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.cadvisor["name"]}.${var.nserbin_website["domain"]}"
  content = var.raspberry_pi_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.raspberry_pi_tunnel["comment"]
}

## Prometheus App
resource "cloudflare_zero_trust_access_application" "prometheus_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.prometheus["name"]
  domain                     = var.prometheus["domain"]
  type                       = var.k3s_cluster_tunnel["type"]
  session_duration           = var.k3s_cluster_tunnel["session_duration"]
  auto_redirect_to_identity  = var.k3s_cluster_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
  options_preflight_bypass   = false


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
      uri  = var.prometheus["domain"]
    }
  ]
  logo_url = var.prometheus["logo_url"]
}


## Record for Prometheus
resource "cloudflare_dns_record" "prometheus_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.prometheus["domain"]
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]

}

## Alertmanager App
resource "cloudflare_zero_trust_access_application" "alertmanager_app" {
  zone_id                    = cloudflare_zone.nserbin_website_zone.id
  name                       = var.alertmanager["name"]
  domain                     = var.alertmanager["domain"]
  type                       = var.k3s_cluster_tunnel["type"]
  session_duration           = var.k3s_cluster_tunnel["session_duration"]
  auto_redirect_to_identity  = var.k3s_cluster_tunnel["auto_redirect_to_identity"]
  http_only_cookie_attribute = true
  allowed_idps               = [cloudflare_zero_trust_access_identity_provider.google_sso.id, cloudflare_zero_trust_access_identity_provider.github_oauth.id]
  options_preflight_bypass   = false


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
      uri  = var.alertmanager["domain"]
    }
  ]
  #logo_url = var.alertmanager["logo_url"]
}


## Record for Alertmanager
resource "cloudflare_dns_record" "alertmanager_record" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.alertmanager["domain"]
  content = var.k3s_cluster_tunnel["record"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.k3s_cluster_tunnel["comment"]

}
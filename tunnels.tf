## Raspberry PI Tunnel
resource "cloudflare_zero_trust_tunnel_cloudflared" "raspbery_pi_tunnel" {
  account_id = var.accounts_settings["cloudflare_account"]

  name       = var.raspberry_pi_tunnel["name"]
  config_src = "local"
}

## Raspberry PI Access Group

resource "cloudflare_zero_trust_access_group" "raspbery_pi_tunnel_access_group" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "Admin group"

  include = [
    {
      login_method = {
        id = cloudflare_zero_trust_access_identity_provider.google_sso.id
      }
    },
    {
      login_method = {
        id = cloudflare_zero_trust_access_identity_provider.github_oauth.id
      }
    },
    {
      auth_method = {
        auth_method = "mfa"
      }
    },
    {
      email = {
        email = "${var.nserbin_website["email"]}",
      }
    },

  ]
}


locals {
  default_origin_request = {
    access = {
      required  = false
      team_name = "moodle"
      aud_tag   = []
    }
    connect_timeout          = 30
    keep_alive_connections   = 100
    keep_alive_timeout       = 90
    no_happy_eyeballs        = false
    no_tls_verify            = false
    disable_chunked_encoding = true
    http2_origin             = true
    http_host_header         = null
    origin_server_name       = null
    proxy_type               = null
    tcp_keep_alive           = 30
    tls_timeout              = 10
  }

  ingress_services = [
    var.grafana,
    var.bitwarden,
    var.portainer,
    var.pihole,
    var.cadvisor,
    var.freshrss,
    var.homepage,
    var.filebrowser,
    var.n8n,
    var.uptimekuma,
    var.prometheus,
    merge(var.ssh, {
      origin_request = merge(
        local.default_origin_request,
        {
          access = {
            required  = true
            team_name = "moodle"
            aud_tag   = [cloudflare_zero_trust_access_application.ssh_tunnel_app.aud]
          }
        }
      )
    }),
    var.backend,
    var.docuseal
  ]
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "raspberry_pi_public_hostnames" {
  account_id = var.accounts_settings["cloudflare_account"]
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspbery_pi_tunnel.id
  source     = "cloudflare"

  config = {
    origin_request = {
      connect_timeout          = 30
      keep_alive_connections   = 0
      proxy_port               = 0
      no_happy_eyeballs        = false
      no_tls_verify            = true
      http2_origin             = false
      disable_chunked_encoding = false
      proxy_address            = ""
    }

    ingress = concat(
      [
        for svc in local.ingress_services : {
          hostname       = svc["domain"]
          service        = svc["url"]
          origin_request = try(svc["origin_request"], local.default_origin_request)
        }
      ],
      [
        {
          service = "http_status:404"
        }
      ]
    )
  }
}



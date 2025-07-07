## Raspberry PI Tunnel
resource "cloudflare_zero_trust_tunnel_cloudflared" "raspbery_pi_tunnel" {
  account_id = var.accounts_settings["cloudflare_account"]

  name       = var.raspberry_pi_tunnel["name"]
  config_src = "local"
}

## Raspberry PI Access Group

resource "cloudflare_zero_trust_access_group" "raspbery_pi_tunnel_access_group" {
  #account_id = var.accounts_settings["cloudflare_account"]
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
        email = "nicolas.serbin@gmail.com",
      }
    },

  ]
}


resource "cloudflare_zero_trust_tunnel_cloudflared_config" "raspberry_pi_public_hostnames" {
  account_id = var.accounts_settings["cloudflare_account"]
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspbery_pi_tunnel.id
  source     = "cloudflare"

  config = {
    warp_routing = {
      enabled = var.raspberry_pi_tunnel["warp_routing"]
    }

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

    ingress = [
      {
        hostname = var.grafana["domain"]
        service  = var.grafana["url"]
        origin_request = {
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
      },
      {
        hostname = var.bitwarden["domain"]
        service  = var.bitwarden["url"]
        origin_request = {
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
      },
      {
        hostname = var.portainer["domain"]
        service  = var.portainer["url"]
        origin_request = {
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
      },
      {
        hostname = var.pihole["domain"]
        service  = var.pihole["url"]
        origin_request = {
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
      },
      {
        hostname = var.cadvisor["domain"]
        service  = var.cadvisor["url"]
        origin_request = {
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
      },
      {
        hostname = var.freshrss["domain"]
        service  = var.freshrss["url"]
        origin_request = {
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
      },
      {
        hostname = var.homepage["domain"]
        service  = var.homepage["url"]
        origin_request = {
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
      },
      {
        hostname = var.filebrowser["domain"]
        service  = var.filebrowser["url"]
        origin_request = {
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
      },
      {
        hostname = var.n8n["domain"]
        service  = var.n8n["url"]
        origin_request = {
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
      },
      {
        hostname = var.uptimekuma["domain"]
        service  = var.uptimekuma["url"]
        origin_request = {
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
      },
      {
        hostname = var.prometheus["domain"]
        service  = var.prometheus["url"]
        origin_request = {
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
      },
      {
        hostname = var.ssh["domain"]
        service  = var.ssh["url"]
        origin_request = {
          access = {
            required  = true
            team_name = "moodle"
            aud_tag   = [cloudflare_zero_trust_access_application.ssh_tunnel_app.aud]
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
      },
      {
        hostname = var.backend["domain"]
        service  = var.backend["url"]
        origin_request = {
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
      },
      {
        hostname = var.docuseal["domain"]
        service  = var.docuseal["url"]
        origin_request = {
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
      },
      {
        service = "http_status:404"
      }
    ]
  }
}



## Raspberry PI Tunnel
resource "cloudflare_zero_trust_tunnel_cloudflared" "raspbery_pi_tunnel" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.raspberry_pi_tunnel["name"]
  #tunnel_secret = var.raspberry_pi_tunnel["secret"]
  config_src = "cloudflare"
}

## Raspberry PI Access Group

resource "cloudflare_zero_trust_access_group" "raspbery_pi_tunnel_access_group" {
  #account_id = var.accounts_settings["cloudflare_account"]
  zone_id = "59d8508fe3545bf6712204472ebac030"
  name    = "Admin group"

  include = [
    {
      login_method = {
        id = "${cloudflare_zero_trust_access_identity_provider.google_sso.id}"
      }
    },
    {
      login_method = {
        id = "${cloudflare_zero_trust_access_identity_provider.github_oauth.id}"
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

  config = {
    ingress = [
      {
        hostname = var.grafana["domain"]
        service  = var.grafana["url"]
      },
      {
        hostname = var.bitwarden["domain"]
        service  = var.bitwarden["url"]
      },
      {
        hostname = var.portainer["domain"]
        service  = var.portainer["url"]
      },
      {
        hostname = var.pihole["domain"]
        service  = var.pihole["url"]
      },
      {
        hostname = var.cadvisor["domain"]
        service  = var.cadvisor["url"]
      },
      {
        hostname = var.freshrss["domain"]
        service  = var.freshrss["url"]
      },
      {
        hostname = var.homepage["domain"]
        service  = var.homepage["url"]
      },
      {
        hostname = var.filebrowser["domain"]
        service  = var.filebrowser["url"]
      },
      {
        hostname = var.n8n["domain"]
        service  = var.n8n["url"]
      },
      {
        hostname = var.uptimekuma["domain"]
        service  = var.uptimekuma["url"]
      },
      {
        hostname = var.prometheus["domain"]
        service  = var.prometheus["url"]
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
        }
      },
      {
        hostname = var.backend["domain"]
        service  = var.backend["url"]
      },
      {
        hostname = var.docuseal["domain"]
        service  = var.docuseal["url"]
      },
      {
        service = "http_status:404"
      }
    ]
  }
}


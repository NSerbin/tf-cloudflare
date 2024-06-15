## Raspberry PI Tunnel
resource "cloudflare_tunnel" "raspbery_pi_tunnel" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.raspberry_pi_tunnel["name"]
  secret     = var.raspberry_pi_tunnel["secret"]
  config_src = "cloudflare"
}

## Raspberry PI Access Group

resource "cloudflare_access_group" "raspbery_pi_tunnel_access_group" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = "Admin group"

  include {
    email        = ["nicolas.serbin@gmail.com"]
    login_method = ["${cloudflare_access_identity_provider.google_sso.id}", "${cloudflare_access_identity_provider.github_oauth.id}"]
    auth_method  = "mfa"
  }

}

resource "cloudflare_tunnel_config" "raspberry_pi_public_hostnames" {
  account_id = var.accounts_settings["cloudflare_account"]
  tunnel_id  = cloudflare_tunnel.raspbery_pi_tunnel.id
  config {

    warp_routing {
      enabled = var.raspberry_pi_tunnel["warp_routing"]
    }

    origin_request {
      bastion_mode             = false
      connect_timeout          = "30s"
      keep_alive_connections   = 0
      proxy_port               = 0
      no_happy_eyeballs        = false
      no_tls_verify            = true
      http2_origin             = false
      disable_chunked_encoding = false
      proxy_address            = ""
    }

    ingress_rule {
      hostname = var.grafana["domain"]
      service  = var.grafana["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.bitwarden["domain"]
      service  = var.bitwarden["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.portainer["domain"]
      service  = var.portainer["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.pihole["domain"]
      service  = var.pihole["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.cadvisor["domain"]
      service  = var.cadvisor["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.freshrss["domain"]
      service  = var.freshrss["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.homepage["domain"]
      service  = var.homepage["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.filebrowser["domain"]
      service  = var.filebrowser["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.n8n["domain"]
      service  = var.n8n["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.uptimekuma["domain"]
      service  = var.uptimekuma["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.prometheus["domain"]
      service  = var.prometheus["url"]
      origin_request {
        access {
          required  = false
          team_name = "moodle"
        }
      }
    }

    ingress_rule {
      hostname = var.ssh["domain"]
      service  = var.ssh["url"]
      origin_request {
        access {
          required  = true
          team_name = "moodle"
          aud_tag   = [cloudflare_access_application.ssh_tunnel_app.aud]
        }
      }
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}

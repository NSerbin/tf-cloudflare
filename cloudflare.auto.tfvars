accounts_settings = {
  cloudflare_api_token = "${env:CF_API_TOKEN}"
  cloudflare_account   = "${env:CF_ACCOUNT}"
}

nserbin_website = {
  email         = "${env:NS_EMAIL}"
  help_email    = "${env:NS_HELP_EMAIL}"
  contact_email = "${env:NS_CONTACT_EMAIL}"
  domain        = "${env:NS_URL}"
  name_www      = "www"
  value         = "${env:NS_GH_URL}"
  comment       = "Redirect from GitHub Pages"
}

nserbin_website_zone = {
  plan = "free"
  type = "full"
}

raspberry_pi_tunnel = {
  name                      = "Raspberry PI"
  secret                    = "${env:RPI_TOKEN}"
  warp_routing              = false
  auto_redirect_to_identity = false
  type                      = "self_hosted"
  session_duration          = "24h"
  record                    = "${env:RPI_TUNNEL_ID}"
  comment                   = "Raspberry PI Tunnel"
}

mailersend = {
  proxied     = false
  comment     = "${env:MAILSENDER_COMMENT}"
  txt_name    = "_dmarc"
  txt_value   = "${env:MAILSENDER_TXT_VALUE}"
  txt_type    = "TXT"
  spf_value   = "${env:MAILSENDER_SPF_VALUE}"
  return_name = "${env:MAILSENDER_RETURN_NAME}"
  return_vale = "${env:MAILSENDER_RETURN_VALUE}"
}

mailersend_domainkey = {
  name_1  = "${env:MAILSENDER_DOMAINKEY_NAME}"
  value_1 = "${env:MAILSENDER_DOMAINKEY_VALUE}"
}

dns_records = {
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

google_sso = {
  name          = "Google-SSO"
  type          = "google"
  client_id     = "${env:GOOGLE_CLIENT_ID}"
  client_secret = "${env:GOOGLE_CLIENT_SECRET}"
}

github_sso = {
  name          = "GitHub OAuth"
  type          = "github"
  client_id     = "${env:GH_CLIENT_ID}"
  client_secret = "${env:GH_CLIENT_SECRET}"
}

grafana = {
  prefix   = "monitor"
  name     = "grafana"
  url      = "${env:GRAFANA_URL}"
  domain   = "${env:GRAFANA_DOMAIN}"
  logo_url = "${env:GRAFANA_LOGO_URL}"
}

cadvisor = {
  name     = "cadvisor"
  url      = "${env:CADVISOR_URL}"
  domain   = "${env:CADVISOR_DOMAIN}"
  logo_url = "${env:CADVISOR_LOGO_URL}"
}

prometheus = {
  name     = "prometheus"
  url      = "${env:PROMETHEUS_URL}"
  domain   = "${env:PROMETHEUS_DOMAIN}"
  logo_url = "${env:PROMETHEUS_LOGO_URL}"
}

freshrss = {
  name     = "freshrss"
  prefix   = "rss"
  url      = "${env:FRESHRSS_URL}"
  domain   = "${env:FRESHRSS_DOMAIN}"
  logo_url = "${env:FRESHRSS_LOGO_URL}"
}

homepage = {
  name     = "home"
  url      = "${env:HOMEPAGE_URL}"
  domain   = "${env:HOMEPAGE_DOMAIN}"
  logo_url = "${env:HOMEPAGE_LOGO_URL}"
}

n8n = {
  name     = "n8n"
  url      = "${env:N8N_URL}"
  domain   = "${env:N8N_DOMAIN}"
  logo_url = "${env:N8N_LOGO_URL}"
}

filebrowser = {
  name     = "FileBrowser"
  prefix   = "vault"
  url      = "${env:FILEBROWSER_URL}"
  domain   = "${env:FILEBROWSER_DOMAIN}"
  logo_url = "${env:FILEBROWSER_LOGO_URL}"
}

uptimekuma = {
  name     = "status"
  url      = "${env:UPTIMEKUMA_URL}"
  domain   = "${env:UPTIMEKUMA_DOMAIN}"
  logo_url = "${env:UPTIMEKUMA_LOGO_URL}"
}

portainer = {
  name     = "portainer"
  url      = "${env:PORTAINER_URL}"
  domain   = "${env:PORTAINER_DOMAIN}"
  logo_url = "${env:PORTAINER_LOGO_URL}"
}

pihole = {
  name     = "pihole"
  url      = "${env:PIHOLE_URL}"
  domain   = "${env:PIHOLE_DOMAIN}"
  logo_url = "${env:PIHOLE_LOGO_URL}"
}

bitwarden = {
  name         = "bitwarden"
  prefix       = "btw"
  url          = "${env:BITWARDEN_URL}"
  domain       = "${env:BITWARDEN_DOMAIN}"
  admin_domain = "${env:BITWARDEN_ADMIN_DOMAIN}"
  logo_url     = "${env:BITWARDEN_LOGO_URL}"
}

ssh = {
  name   = "SSH Tunnel"
  url    = "${env:SSH_URL}"
  domain = "${env:SSH_DOMAIN}"
  type   = "ssh"
}

backend = {
  name   = "tf-backend"
  url    = "${env:BACKEND_URL}"
  domain = "${env:BACKEND_DOMAIN}"
}

docuseal = {
  name   = "docs"
  url    = "${env:DOCUSEAL_URL}"
  domain = "${env:DOCUSEAL_DOMAIN}"
}
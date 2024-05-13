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
}

sendgrid_em = {
  name_1  = "${env:SENDGRID_EM_NAME_1}"
  value   = "${env:SENDGRID_EM_VALUE}"
  name_2  = "${env:SENDGRID_EM_NAME_2}"
  name_3  = "${env:SENDGRID_EM_NAME_3}"
  name_4  = "${env:SENDGRID_EM_NAME_4}"
}

sendgrid_url = {
  name_1 = "${env:SENDGRID_URL_NAME_1}"
  name_2 = "${env:SENDGRID_URL_NAME_2}"
  name_3 = "${env:SENDGRID_URL_NAME_3}"
  name_4 = "${env:SENDGRID_URL_NAME_4}"
  name_5 = "${env:SENDGRID_URL_NAME_5}"
  name_6 = "${env:SENDGRID_URL_NAME_6}"
}

sendgrid = {
  name      = "${env:SENDGRID_NAME}"
  value     = "sendgrid.net"
  proxied   = false
  comment   = "SendGrid Email"
  txt_name  = "_dmarc"
  txt_value = "v=DMARC1; p=none;"
  txt_type  = "TXT"
}

sendgrid_domainkey = {
  name_1  = "${env:SENDGRID_DOMAINKEY_NAME_1}"
  name_2  = "${env:SENDGRID_DOMAINKEY_NAME_2}"
  value_1 = "${env:SENDGRID_DOMAINKEY_VALUE_1}"
  value_2 = "${env:SENDGRID_DOMAINKEY_VALUE_2}"
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
  name     = "Grafana"
  url      = "${env:GRAFANA_URL}"
  domain   = "${env:GRAFANA_DOMAIN}"
  logo_url = "${env:GRAFANA_LOGO_URL}"
}

cadvisor = {
  name     = "CAdvisor"
  url      = "${env:CADVISOR_URL}"
  domain   = "${env:CADVISOR_DOMAIN}"
  logo_url = "${env:CADVISOR_LOGO_URL}"
}

prometheus = {
  name     = "Prometheus"
  url      = "${env:PROMETHEUS_URL}"
  domain   = "${env:PROMETHEUS_DOMAIN}"
  logo_url = "${env:PROMETHEUS_LOGO_URL}"
}

freshrss = {
  name     = "FreshRSS"
  url      = "${env:FRESHRSS_URL}"
  domain   = "${env:FRESHRSS_DOMAIN}"
  logo_url = "${env:FRESHRSS_LOGO_URL}"
}

homepage = {
  name     = "Homepage Dashboard"
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
  url      = "${env:FILEBROWSER_URL}"
  domain   = "${env:FILEBROWSER_DOMAIN}"
  logo_url = "${env:FILEBROWSER_LOGO_URL}"
}

remmina = {
  name     = "Remmina SSH"
  url      = "${env:REMMINA_URL}"
  domain   = "${env:REMMINA_DOMAIN}"
  logo_url = "${env:REMMINA_LOGO_URL}"
}

uptimekuma = {
  name     = "Status"
  url      = "${env:UPTIMEKUMA_URL}"
  domain   = "${env:UPTIMEKUMA_DOMAIN}"
  logo_url = "${env:UPTIMEKUMA_LOGO_URL}"
}

portainer = {
  name     = "Portainer"
  url      = "${env:PORTAINER_URL}"
  domain   = "${env:PORTAINER_DOMAIN}"
  logo_url = "${env:PORTAINER_LOGO_URL}" 
}

pihole = {
  name     = "PiHole"
  url      = "${env:PIHOLE_URL}"
  domain   = "${env:PIHOLE_DOMAIN}"
  logo_url = "${env:PIHOLE_LOGO_URL}"
}

bitwarden = {
  name         = "Bitwarden"
  url          = "${env:BITWARDEN_URL}"
  domain       = "${env:BITWARDEN_DOMAIN}"
  admin_domain = "${env:BITWARDEN_ADMIN_DOMAIN}"
  logo_url     = "${env:BITWARDEN_LOGO_URL}"
}
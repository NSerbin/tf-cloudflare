accounts_settings = {
  cloudflare_api_token = var.CF_API_TOKEN
  cloudflare_account   = var.CF_ACCOUNT
}

nserbin_website = {
  email         = var.NS_EMAIL
  help_email    = var.NS_HELP_EMAIL
  contact_email = var.NS_CONTACT_EMAIL
  domain        = var.NS_URL
  name_www      = "www"
  value         = var.NS_GH_URL
  comment       = "Redirect from GitHub Pages"
}

nserbin_website_zone = {
  plan = "free"
  type = "full"
}

raspberry_pi_tunnel = {
  name                      = "Raspberry PI"
  secret                    = var.RPI_TOKEN
  warp_routing              = false
  auto_redirect_to_identity = false
  type                      = "self_hosted"
  session_duration          = "24h"  
}

sendgrid_em = {
  name_1  = var.SENDGRID_EM_NAME_1
  value   = var.SENDGRID_EM_VALUE
  name_2  = var.SENDGRID_EM_NAME_2
  name_3  = var.SENDGRID_EM_NAME_3
  name_4  = var.SENDGRID_EM_NAME_4
}

sendgrid_url = {
  name_1 = var.SENDGRID_URL_NAME_1
  name_2 = var.SENDGRID_URL_NAME_2
  name_3 = var.SENDGRID_URL_NAME_3
  name_4 = var.SENDGRID_URL_NAME_4
  name_5 = var.SENDGRID_URL_NAME_5
  name_6 = var.SENDGRID_URL_NAME_6
}

sendgrid = {
  name      = var.SENDGRID_NAME
  value     = "sendgrid.net"
  proxied   = false
  comment   = "SendGrid Email"
  txt_name  = "_dmarc"
  txt_value = "v=DMARC1; p=none;"
  txt_type  = "TXT"
}

sendgrid_domainkey = {
  name_1  = var.SENDGRID_DOMAINKEY_NAME_1
  name_2  = var.SENDGRID_DOMAINKEY_NAME_2
  value_1 = var.SENDGRID_DOMAINKEY_VALUE_1
  value_2 = var.SENDGRID_DOMAINKEY_VALUE_2
}

dns_records = {
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

google_sso = {
  name          = "Google-SSO"
  type          = "google"
  client_id     = var.GOOGLE_CLIENT_ID
  client_secret = var.GOOGLE_CLIENT_SECRET
}

github_sso = {
  name          = "GitHub OAuth"
  type          = "github"
  client_id     = var.GH_CLIENT_ID
  client_secret = var.GH_CLIENT_SECRET
}

grafana = {
  name     = "Grafana"
  url      = var.GRAFANA_URL
  domain   = var.GRAFANA_DOMAIN
  logo_url = var.GRAFANA_LOGO_URL
}

cadvisor = {
  name     = "CAdvisor"
  url      = var.CADVISOR_URL
  domain   = var.CADVISOR_DOMAIN
  logo_url = var.CADVISOR_LOGO_URL
}

prometheus = {
  name     = "Prometheus"
  url      = var.PROMETHEUS_URL
  domain   = var.PROMETHEUS_DOMAIN
  logo_url = var.PROMETHEUS_LOGO_URL
}

freshrss = {
  name     = "FreshRSS"
  url      = var.FRESHRSS_URL
  domain   = var.FRESHRSS_DOMAIN
  logo_url = var.FRESHRSS_LOGO_URL
}

homepage = {
  name     = "Homepage Dashboard"
  url      = var.HOMEPAGE_URL
  domain   = var.HOMEPAGE_DOMAIN
  logo_url = var.HOMEPAGE_LOGO_URL
}

n8n = {
  name     = "n8n"
  url      = var.N8N_URL
  domain   = var.N8N_DOMAIN
  logo_url = var.N8N_LOGO_URL
}

filebrowser = {
  name     = "FileBrowser"
  url      = var.FILEBROWSER_URL
  domain   = var.FILEBROWSER_DOMAIN
  logo_url = var.FILEBROWSER_LOGO_URL
}

remmina = {
  name     = "Remmina SSH"
  url      = var.REMMINA_URL
  domain   = var.REMMINA_DOMAIN
  logo_url = var.REMMINA_LOGO_URL
}

uptimekuma = {
  name     = "Status"
  url      = var.UPTIMEKUMA_URL
  domain   = var.UPTIMEKUMA_DOMAIN
  logo_url = var.UPTIMEKUMA_LOGO_URL
}

portainer = {
  name     = "Portainer"
  url      = var.PORTAINER_URL
  domain   = var.PORTAINER_DOMAIN
  logo_url = var.PORTAINER_LOGO_URL 
}

pihole = {
  name     = "PiHole"
  url      = var.PIHOLE_URL
  domain   = var.PIHOLE_DOMAIN
  logo_url = var.PIHOLE_LOGO_URL
}

bitwarden = {
  name         = "Bitwarden"
  url          = var.BITWARDEN_URL
  domain       = var.BITWARDEN_DOMAIN
  admin_domain = var.BITWARDEN_ADMIN_DOMAIN
  logo_url     = var.BITWARDEN_LOGO_URL
}
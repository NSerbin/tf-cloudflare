accounts_settings = {
  cloudflare_api_token = ${CF_API_TOKEN}
  cloudflare_account   = ${CF_ACCOUNT}
}

nserbin_website = {
  email         = ${NS_EMAIL}
  help_email    = ${NS_HELP_EMAIL}
  contact_email = ${NS_CONTACT_EMAIL}
  domain        = ${NS_URL}
  name_www      = "www"
  value         = ${NS_GH_URL}
  comment       = "Redirect from GitHub Pages"
}

nserbin_website_zone = {
  plan = "free"
  type = "full"
}

raspberry_pi_tunnel = {
  name                      = "Raspberry PI"
  secret                    = ${RPI_TOKEN}
  warp_routing              = false
  auto_redirect_to_identity = false
  type                      = "self_hosted"
  session_duration          = "24h"  
}

sendgrid_em = {
  name_1  = ${SENDGRID_EM_NAME_1}
  value   = ${SENDGRID_EM_VALUE}
  name_2  = ${SENDGRID_EM_NAME_2}
  name_3  = ${SENDGRID_EM_NAME_3}
  name_4  = ${SENDGRID_EM_NAME_4}
}

sendgrid_url = {
  name_1 = ${SENDGRID_URL_NAME_1}
  name_2 = ${SENDGRID_URL_NAME_2}
  name_3 = ${SENDGRID_URL_NAME_3}
  name_4 = ${SENDGRID_URL_NAME_4}
  name_5 = ${SENDGRID_URL_NAME_5}
  name_6 = ${SENDGRID_URL_NAME_6}
}

sendgrid = {
  name      = ${SENDGRID_NAME}
  value     = "sendgrid.net"
  proxied   = false
  comment   = "SendGrid Email"
  txt_name  = "_dmarc"
  txt_value = "v=DMARC1; p=none;"
  txt_type  = "TXT"
}

sendgrid_domainkey = {
  name_1  = ${SENDGRID_DOMAINKEY_NAME_1}
  name_2  = ${SENDGRID_DOMAINKEY_NAME_2}
  value_1 = ${SENDGRID_DOMAINKEY_VALUE_1}
  value_2 = ${SENDGRID_DOMAINKEY_VALUE_2}
}

dns_records = {
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

google_sso = {
  name          = "Google-SSO"
  type          = "google"
  client_id     = ${GOOGLE_CLIENT_ID}
  client_secret = ${GOOGLE_CLIENT_SECRET}
}

github_sso = {
  name          = "GitHub OAuth"
  type          = "github"
  client_id     = ${GH_CLIENT_ID}
  client_secret = ${GH_CLIENT_SECRET}
}

grafana = {
  name     = "Grafana"
  url      = ${GRAFANA_URL}
  domain   = ${GRAFANA_DOMAIN}
  logo_url = ${GRAFANA_LOGO_URL}
}

cadvisor = {
  name     = "CAdvisor"
  url      = ${CADVISOR_URL}
  domain   = ${CADVISOR_DOMAIN}
  logo_url = ${CADVISOR_LOGO_URL}
}

prometheus = {
  name     = "Prometheus"
  url      = ${PROMETHEUS_URL}
  domain   = ${PROMETHEUS_DOMAIN}
  logo_url = ${PROMETHEUS_LOGO_URL}
}

freshrss = {
  name     = "FreshRSS"
  url      = ${FRESHRSS_URL}
  domain   = ${FRESHRSS_DOMAIN}
  logo_url = ${FRESHRSS_LOGO_URL}
}

homepage = {
  name     = "Homepage Dashboard"
  url      = ${HOMEPAGE_URL}
  domain   = ${HOMEPAGE_DOMAIN}
  logo_url = ${HOMEPAGE_LOGO_URL}
}

n8n = {
  name     = "n8n"
  url      = ${N8N_URL}
  domain   = ${N8N_DOMAIN}
  logo_url = ${N8N_LOGO_URL}
}

filebrowser = {
  name     = "FileBrowser"
  url      = ${FILEBROWSER_URL}
  domain   = ${FILEBROWSER_DOMAIN}
  logo_url = ${FILEBROWSER_LOGO_URL}
}

remmina = {
  name     = "Remmina SSH"
  url      = ${REMMINA_URL}
  domain   = ${REMMINA_DOMAIN}
  logo_url = ${REMMINA_LOGO_URL}
}

uptimekuma = {
  name     = "Status"
  url      = ${UPTIMEKUMA_URL}
  domain   = ${UPTIMEKUMA_DOMAIN}
  logo_url = ${UPTIMEKUMA_LOGO_URL}
}

portainer = {
  name     = "Portainer"
  url      = ${PORTAINER_URL}
  domain   = ${PORTAINER_DOMAIN}
  logo_url = ${PORTAINER_LOGO_URL }
}

pihole = {
  name     = "PiHole"
  url      = ${PIHOLE_URL}
  domain   = ${PIHOLE_DOMAIN}
  logo_url = ${PIHOLE_LOGO_URL}
}

bitwarden = {
  name         = "Bitwarden"
  url          = ${BITWARDEN_URL}
  domain       = ${BITWARDEN_DOMAIN}
  admin_domain = ${BITWARDEN_ADMIN_DOMAIN}
  logo_url     = ${BITWARDEN_LOGO_URL}
}
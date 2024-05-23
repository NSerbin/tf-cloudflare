accounts_settings = {
  cloudflare_api_token = "${{ secrets.CF_API_TOKEN }}"
  cloudflare_account   = "${{ secrets.CF_ACCOUNT }}"
}

nserbin_website = {
  email         = "${{ secrets.NS_EMAIL }}"
  help_email    = "${{ secrets.NS_HELP_EMAIL }}"
  contact_email = "${{ secrets.NS_CONTACT_EMAIL }}"
  domain        = "${{ secrets.NS_URL }}"
  name_www      = "www"
  value         = "${{ secrets.NS_GH_URL }}"
  comment       = "Redirect from GitHub Pages"
}

nserbin_website_zone = {
  plan = "free"
  type = "full"
}

raspberry_pi_tunnel = {
  name                      = "Raspberry PI"
  secret                    = "${{ secrets.RPI_TOKEN }}"
  warp_routing              = false
  auto_redirect_to_identity = false
  type                      = "self_hosted"
  session_duration          = "24h"  
}

sendgrid_em = {
  name_1  = "${{ secrets.SENDGRID_EM_NAME_1 }}"
  value   = "${{ secrets.SENDGRID_EM_VALUE }}"
  name_2  = "${{ secrets.SENDGRID_EM_NAME_2 }}"
  name_3  = "${{ secrets.SENDGRID_EM_NAME_3 }}"
  name_4  = "${{ secrets.SENDGRID_EM_NAME_4 }}"
}

sendgrid_url = {
  name_1 = "${{ secrets.SENDGRID_URL_NAME_1 }}"
  name_2 = "${{ secrets.SENDGRID_URL_NAME_2 }}"
  name_3 = "${{ secrets.SENDGRID_URL_NAME_3 }}"
  name_4 = "${{ secrets.SENDGRID_URL_NAME_4 }}"
  name_5 = "${{ secrets.SENDGRID_URL_NAME_5 }}"
  name_6 = "${{ secrets.SENDGRID_URL_NAME_6 }}"
}

sendgrid = {
  name      = "${{ secrets.SENDGRID_NAME }}"
  value     = "sendgrid.net"
  proxied   = false
  comment   = "SendGrid Email"
  txt_name  = "_dmarc"
  txt_value = "v=DMARC1; p=none;"
  txt_type  = "TXT"
}

sendgrid_domainkey = {
  name_1  = "${{ secrets.SENDGRID_DOMAINKEY_NAME_1 }}"
  name_2  = "${{ secrets.SENDGRID_DOMAINKEY_NAME_2 }}"
  value_1 = "${{ secrets.SENDGRID_DOMAINKEY_VALUE_1 }}"
  value_2 = "${{ secrets.SENDGRID_DOMAINKEY_VALUE_2 }}"
}

dns_records = {
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

google_sso = {
  name          = "Google-SSO"
  type          = "google"
  client_id     = "${{ secrets.GOOGLE_CLIENT_ID }}"
  client_secret = "${{ secrets.GOOGLE_CLIENT_SECRET }}"
}

github_sso = {
  name          = "GitHub OAuth"
  type          = "github"
  client_id     = "${{ secrets.GH_CLIENT_ID }}"
  client_secret = "${{ secrets.GH_CLIENT_SECRET }}"
}

grafana = {
  name     = "Grafana"
  url      = "${{ secrets.GRAFANA_URL }}"
  domain   = "${{ secrets.GRAFANA_DOMAIN }}"
  logo_url = "${{ secrets.GRAFANA_LOGO_URL }}"
}

cadvisor = {
  name     = "CAdvisor"
  url      = "${{ secrets.CADVISOR_URL }}"
  domain   = "${{ secrets.CADVISOR_DOMAIN }}"
  logo_url = "${{ secrets.CADVISOR_LOGO_URL }}"
}

prometheus = {
  name     = "Prometheus"
  url      = "${{ secrets.PROMETHEUS_URL }}"
  domain   = "${{ secrets.PROMETHEUS_DOMAIN }}"
  logo_url = "${{ secrets.PROMETHEUS_LOGO_URL }}"
}

freshrss = {
  name     = "FreshRSS"
  url      = "${{ secrets.FRESHRSS_URL }}"
  domain   = "${{ secrets.FRESHRSS_DOMAIN }}"
  logo_url = "${{ secrets.FRESHRSS_LOGO_URL }}"
}

homepage = {
  name     = "Homepage Dashboard"
  url      = "${{ secrets.HOMEPAGE_URL }}"
  domain   = "${{ secrets.HOMEPAGE_DOMAIN }}"
  logo_url = "${{ secrets.HOMEPAGE_LOGO_URL }}"
}

n8n = {
  name     = "n8n"
  url      = "${{ secrets.N8N_URL }}"
  domain   = "${{ secrets.N8N_DOMAIN }}"
  logo_url = "${{ secrets.N8N_LOGO_URL }}"
}

filebrowser = {
  name     = "FileBrowser"
  url      = "${{ secrets.FILEBROWSER_URL }}"
  domain   = "${{ secrets.FILEBROWSER_DOMAIN }}"
  logo_url = "${{ secrets.FILEBROWSER_LOGO_URL }}"
}

remmina = {
  name     = "Remmina SSH"
  url      = "${{ secrets.REMMINA_URL }}"
  domain   = "${{ secrets.REMMINA_DOMAIN }}"
  logo_url = "${{ secrets.REMMINA_LOGO_URL }}"
}

uptimekuma = {
  name     = "Status"
  url      = "${{ secrets.UPTIMEKUMA_URL }}"
  domain   = "${{ secrets.UPTIMEKUMA_DOMAIN }}"
  logo_url = "${{ secrets.UPTIMEKUMA_LOGO_URL }}"
}

portainer = {
  name     = "Portainer"
  url      = "${{ secrets.PORTAINER_URL }}"
  domain   = "${{ secrets.PORTAINER_DOMAIN }}"
  logo_url = "${{ secrets.PORTAINER_LOGO_URL }}"
}

pihole = {
  name     = "PiHole"
  url      = "${{ secrets.PIHOLE_URL }}"
  domain   = "${{ secrets.PIHOLE_DOMAIN }}"
  logo_url = "${{ secrets.PIHOLE_LOGO_URL }}"
}

bitwarden = {
  name         = "Bitwarden"
  url          = "${{ secrets.BITWARDEN_URL }}"
  domain       = "${{ secrets.BITWARDEN_DOMAIN }}"
  admin_domain = "${{ secrets.BITWARDEN_ADMIN_DOMAIN }}"
  logo_url     = "${{ secrets.BITWARDEN_LOGO_URL }}"
}
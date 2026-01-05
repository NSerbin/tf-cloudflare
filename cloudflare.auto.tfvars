accounts_settings = {
  cloudflare_api_token = "${CF_API_TOKEN}"
  cloudflare_account   = "${CF_ACCOUNT}"
}

nserbin_website = {
  email         = "${NS_EMAIL}"
  help_email    = "${NS_HELP_EMAIL}"
  contact_email = "${NS_CONTACT_EMAIL}"
  domain        = "${NS_URL}"
  name_www      = "www"
  value         = "${NS_GH_URL}"
  comment       = "Redirect from GitHub Pages"
}

nserbin_website_zone = {
  plan = "free"
  type = "full"
}

raspberry_pi_tunnel = {
  name                      = "Raspberry PI"
  secret                    = "${RPI_TOKEN}"
  warp_routing              = false
  auto_redirect_to_identity = false
  type                      = "self_hosted"
  session_duration          = "24h"
  record                    = "${RPI_TUNNEL_ID}"
  comment                   = "Raspberry PI Tunnel"
}

k3s_cluster_tunnel = {
  name                      = "k3s-cluster"
  secret                    = "${K3S_TOKEN}"
  warp_routing              = false
  auto_redirect_to_identity = false
  type                      = "self_hosted"
  session_duration          = "24h"
  record                    = "${K3S_TOKEN}"
  comment                   = "k3s Cluster Tunnel"
}

mailersend = {
  proxied      = false
  comment      = "${MAILSENDER_COMMENT}"
  txt_name     = "_dmarc"
  txt_value    = "${MAILSENDER_TXT_VALUE}"
  txt_type     = "TXT"
  spf_value    = "${MAILSENDER_SPF_VALUE}"
  return_name  = "${MAILSENDER_RETURN_NAME}"
  return_value = "${MAILSENDER_RETURN_VALUE}"
}

mailersend_domainkey = {
  name_1  = "${MAILSENDER_DOMAINKEY_NAME}"
  value_1 = "${MAILSENDER_DOMAINKEY_VALUE}"
}

dns_records = {
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

google_sso = {
  name          = "Google-SSO"
  type          = "google"
  client_id     = "${GOOGLE_CLIENT_ID}"
  client_secret = "${GOOGLE_CLIENT_SECRET}"
}

github_sso = {
  name          = "GitHub OAuth"
  type          = "github"
  client_id     = "${GH_CLIENT_ID}"
  client_secret = "${GH_CLIENT_SECRET}"
}

grafana = {
  prefix   = "monitor"
  name     = "grafana"
  domain   = "${GRAFANA_DOMAIN}"
  logo_url = "${GRAFANA_LOGO_URL}"
}

cadvisor = {
  name     = "cadvisor"
  domain   = "${CADVISOR_DOMAIN}"
  logo_url = "${CADVISOR_LOGO_URL}"
}

prometheus = {
  name     = "prometheus"
  domain   = "${PROMETHEUS_DOMAIN}"
  logo_url = "${PROMETHEUS_LOGO_URL}"
}

freshrss = {
  name     = "freshrss"
  prefix   = "rss"
  domain   = "${FRESHRSS_DOMAIN}"
  logo_url = "${FRESHRSS_LOGO_URL}"
}

freedium-web = {
  prefix   = "free"
  name     = "freedium"
  domain   = "${FREEDIUM_DOMAIN}"
  logo_url = ""
}

authentik = {
  prefix   = "auth"
  name     = "authentik"
  domain   = "${AUTHENTIK_DOMAIN}"
  logo_url = ""
}

homepage = {
  name     = "home"
  domain   = "${HOMEPAGE_DOMAIN}"
  logo_url = "${HOMEPAGE_LOGO_URL}"
}

n8n = {
  name     = "n8n"
  domain   = "${N8N_DOMAIN}"
  logo_url = "${N8N_LOGO_URL}"
}

filebrowser = {
  name     = "FileBrowser"
  prefix   = "vault"
  domain   = "${FILEBROWSER_DOMAIN}"
  logo_url = "${FILEBROWSER_LOGO_URL}"
}

uptimekuma = {
  name     = "status"
  domain   = "${UPTIMEKUMA_DOMAIN}"
  logo_url = "${UPTIMEKUMA_LOGO_URL}"
}

portainer = {
  name     = "portainer"
  domain   = "${PORTAINER_DOMAIN}"
  logo_url = "${PORTAINER_LOGO_URL}"
}

pihole = {
  name     = "pihole"
  domain   = "${PIHOLE_DOMAIN}"
  logo_url = "${PIHOLE_LOGO_URL}"
}

bitwarden = {
  name         = "bitwarden"
  prefix       = "btw"
  domain       = "${BITWARDEN_DOMAIN}"
  admin_domain = "${BITWARDEN_ADMIN_DOMAIN}"
  logo_url     = "${BITWARDEN_LOGO_URL}"
}

ssh = {
  name   = "SSH Tunnel"
  domain = "${SSH_DOMAIN}"
  type   = "ssh"
}

backend = {
  name   = "tf-backend"
  domain = "${BACKEND_DOMAIN}"
}

docuseal = {
  name   = "docs"
  domain = "${DOCUSEAL_DOMAIN}"
}

traefik = {
  name   = "traefik"
  domain = "${TRAEFIK_DOMAIN}"
  #logo_url = ""
}

argo = {
  name   = "argo"
  domain = "${ARGO_DOMAIN}"
  #logo_url = ""
}

grimoire = {
  name   = "grimoire"
  domain = "${GRIMOIRE_DOMAIN}"
  #logo_url = ""
}

it-tools = {
  name   = "it-tools"
  domain = "tools.nserbin.com"
  #logo_url = ""
}

yopass = {
  name   = "yopass"
  domain = "${YOPASS_DOMAIN}"
  #logo_url = ""
}

alertmanager = {
  name   = "alertmanager"
  domain = "${ALERTMANAGER_DOMAIN}"
  #logo_url = ""
}
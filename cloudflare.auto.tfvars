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

raspberry_pi = {
  name   = "Raspberry PI"
  secret = "${env:RPI_TOKEN}"
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
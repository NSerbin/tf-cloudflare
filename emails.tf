### EMAIL Routing

resource "cloudflare_email_routing_catch_all" "default_email_catch_all" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "forward all to personal gmail"
  enabled = true

  matchers = [{
    type = "all"
  }]

  actions = [{
    type  = "forward"
    value = [var.nserbin_website["email"]]
  }]
}

resource "cloudflare_email_routing_address" "nserbin_gmail" {
  account_id = var.accounts_settings["cloudflare_account"]
  email      = var.nserbin_website["email"]
}

resource "cloudflare_email_routing_rule" "contact_email_rule" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "Contact Email Rule"
  enabled = true

  matchers = [{
    type  = "literal"
    field = "to"
    value = var.nserbin_website["contact_email"]
  }]

  actions = [{
    type  = "forward"
    value = [var.nserbin_website["email"]]
  }]
}

resource "cloudflare_email_routing_rule" "help_email_rule" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "Help Email Rule"
  enabled = true

  matchers = [{
    type  = "literal"
    field = "to"
    value = var.nserbin_website["help_email"]
  }]

  actions = [{
    type  = "forward"
    value = [var.nserbin_website["email"]]
  }]
}
## MailerSend

### SPF Records

resource "cloudflare_dns_record" "mailersend_spf" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.nserbin_website["domain"]
  content = var.mailersend["spf_value"]
  type    = var.mailersend["txt_type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.mailersend["proxied"]
  comment = var.mailersend["comment"]

}

### DomainKey Records

resource "cloudflare_dns_record" "mailersend_domainkey_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.mailersend_domainkey["name_1"]}.${var.nserbin_website["domain"]}"
  content = var.mailersend_domainkey["value_1"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.mailersend["proxied"]
  comment = var.mailersend["comment"]

}

### Return Path Records

resource "cloudflare_dns_record" "mailersend_return_path" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.mailersend["return_name"]
  content = var.mailersend["return_vale"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.mailersend["proxied"]
  comment = var.mailersend["comment"]

}

### Customize Records

# resource "cloudflare_dns_record" "mailersend_customize" {
#   zone_id = cloudflare_zone.nserbin_website_zone.id
#   name    = "${var.mailersend["return_name"]}"
#   content = var.mailersend["return_vale"]
#   type    = var.dns_records["type"]
#   ttl     = var.dns_records["ttl"]
#   proxied = var.mailersend["proxied"]
#   comment = var.mailersend["comment"]
# }

## TXT Records

resource "cloudflare_dns_record" "mailersend_txt" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.mailersend["txt_name"]}.${var.nserbin_website["domain"]}"
  content = var.mailersend["txt_value"]
  type    = var.mailersend["txt_type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.mailersend["proxied"]
  comment = var.mailersend["comment"]

}
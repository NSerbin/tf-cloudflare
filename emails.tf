### EMAIL Routing

resource "cloudflare_email_routing_catch_all" "default_email_catch_all" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "forward all to personal gmail"
  enabled = true

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = [var.nserbin_website["email"]]
  }
}


resource "cloudflare_email_routing_address" "nserbin_gmail" {
  account_id = var.accounts_settings["cloudflare_account"]
  email      = var.nserbin_website["email"]
}

resource "cloudflare_email_routing_rule" "contact_email_rule" {
  zone_id = "59d8508fe3545bf6712204472ebac030"
  name    = "Contact Email Rule"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = var.nserbin_website["contact_email"]
  }

  action {
    type  = "forward"
    value = [var.nserbin_website["email"]]
  }
}

resource "cloudflare_email_routing_rule" "help_email_rule" {
  zone_id = "59d8508fe3545bf6712204472ebac030"
  name    = "Help Email Rule"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = var.nserbin_website["help_email"]
  }

  action {
    type  = "forward"
    value = [var.nserbin_website["email"]]
  }
}

# resource "cloudflare_email_routing_settings" "nserbin_email_routing" {
#   zone_id = cloudflare_zone.nserbin_website_zone.id
#   enabled = "true"
#   skip_wizard = "true"
# }

### Sendgrid EM Records

resource "cloudflare_record" "sendgrid_em_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_em["name_1"]
  value   = var.sendgrid_em["value_1"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_em_2" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_em["name_2"]
  value   = var.sendgrid_em["value_2"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_em_3" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_em["name_3"]
  value   = var.sendgrid_em["value_3"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_em_4" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_em["name_4"]
  value   = var.sendgrid_em["value_4"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

## SendGrid Records

resource "cloudflare_record" "sendgrid" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid["name"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

### URL Records

resource "cloudflare_record" "sendgrid_url_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_url["name_1"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_url_2" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_url["name_2"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_url_3" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_url["name_3"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_url_4" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_url["name_4"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_url_5" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_url["name_5"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_url_6" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_url["name_6"]
  value   = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.sendgrid["comment"]
}

### DomainKey Records

resource "cloudflare_record" "sendgrid_domainkey_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_domainkey["name_1"]
  value   = var.sendgrid_domainkey["value_1"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

resource "cloudflare_record" "sendgrid_domainkey_2" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid_domainkey["name_2"]
  value   = var.sendgrid_domainkey["value_2"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

## TXT Records

resource "cloudflare_record" "sendgrid_txt" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.sendgrid["txt_name"]
  value   = var.sendgrid["txt_value"]
  type    = var.sendgrid["txt_type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
}

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
  zone_id = "59d8508fe3545bf6712204472ebac030"
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
  zone_id = "59d8508fe3545bf6712204472ebac030"
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

### Sendgrid EM Records

resource "cloudflare_dns_record" "sendgrid_em_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_em["name_1"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid_em["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_em_2" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_em["name_2"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid_em["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_em_3" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_em["name_3"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid_em["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_em_4" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_em["name_4"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid_em["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

## SendGrid Records

resource "cloudflare_dns_record" "sendgrid" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid["name"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

### URL Records

resource "cloudflare_dns_record" "sendgrid_url_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_url["name_1"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_url_2" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_url["name_2"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_url_3" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_url["name_3"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_url_4" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_url["name_4"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_url_5" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_url["name_5"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_url_6" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_url["name_6"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

### DomainKey Records

resource "cloudflare_dns_record" "sendgrid_domainkey_1" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_domainkey["name_1"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid_domainkey["value_1"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "sendgrid_domainkey_2" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid_domainkey["name_2"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid_domainkey["value_2"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

## TXT Records

resource "cloudflare_dns_record" "sendgrid_txt" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.sendgrid["txt_name"]}.${var.nserbin_website["domain"]}"
  content = var.sendgrid["txt_value"]
  type    = var.sendgrid["txt_type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.sendgrid["proxied"]
  comment = var.sendgrid["comment"]
  settings = {
    flatten_cname = false
  }
}

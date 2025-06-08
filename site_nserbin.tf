### DNS Records

resource "cloudflare_dns_record" "nserbin_website" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = var.nserbin_website["domain"]
  content = var.nserbin_website["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.nserbin_website["comment"]
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "nserbin_website_www" {
  zone_id = cloudflare_zone.nserbin_website_zone.id
  name    = "${var.nserbin_website["name_www"]}.${var.nserbin_website["domain"]}"
  content = var.nserbin_website["value"]
  type    = var.dns_records["type"]
  ttl     = var.dns_records["ttl"]
  proxied = var.dns_records["proxied"]
  comment = var.nserbin_website["comment"]
  settings = {
    flatten_cname = false
  }
}
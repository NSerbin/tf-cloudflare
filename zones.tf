resource "cloudflare_zone" "nserbin_website_zone" {
  account = {
    id = var.accounts_settings["cloudflare_account"]
  }
  name = var.nserbin_website["domain"]
  type = var.nserbin_website_zone["type"]
}
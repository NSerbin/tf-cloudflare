resource "cloudflare_zone" "nserbin_website_zone" {
  account_id = var.accounts_settings["cloudflare_account"]
  zone       = var.nserbin_website["domain"]
  plan       = var.nserbin_website_zone["plan"]
  type       = var.nserbin_website_zone["type"]
}
resource "cloudflare_tunnel" "raspbery_pi_tunnel" {
  account_id = var.accounts_settings["cloudflare_account"]
  name       = var.raspberry_pi["name"]
  secret     = var.raspberry_pi["secret"]
}
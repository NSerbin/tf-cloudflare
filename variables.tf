variable "accounts_settings" {
  description = "Map containing all unified configuration for accounts"
  type        = map(string)
  default     = {}
}

variable "nserbin_website" {
  description = "Map containing all unified configuration for NSerbin.com Website"
  type        = map(string)
  default     = {}
}

variable "nserbin_website_zone" {
  description = "Map containing all unified configuration for NSerbin.com Website zone"
  type        = map(string)
  default     = {}
}

variable "raspberry_pi_tunnel" {
  description = "Map containing all unified configuration for Raspberry Pi"
  type        = map(string)
  default     = {}
}

variable "mailersend_domainkey" {
  description = "Map containing all unified configuration for Mailersend"
  type        = map(string)
  default     = {}
}

variable "mailersend" {
  description = "Map containing all unified configuration for SendGrid"
  type        = map(string)
  default     = {}
}

variable "dns_records" {
  description = "Map containing all default dns records configuration"
  type        = map(string)
  default     = {}
}

variable "github_sso" {
  description = "Map containing all Github OAuth configuration"
  type        = map(string)
  default     = {}
}

variable "google_sso" {
  description = "Map containing all Google SSO configuration"
  type        = map(string)
  default     = {}
}

variable "grafana" {
  description = "Map containing all Grafana App configuration"
  type        = map(string)
  default     = {}
}

variable "cadvisor" {
  description = "Map containing all Cadvisor App configuration"
  type        = map(string)
  default     = {}
}

variable "prometheus" {
  description = "Map containing all Prometheus App configuration"
  type        = map(string)
  default     = {}
}

variable "freshrss" {
  description = "Map containing all Freshrss App configuration"
  type        = map(string)
  default     = {}
}

variable "homepage" {
  description = "Map containing all Homepage App configuration"
  type        = map(string)
  default     = {}
}

variable "n8n" {
  description = "Map containing all n8n App configuration"
  type        = map(string)
  default     = {}
}

variable "filebrowser" {
  description = "Map containing all FileBrowser App configuration"
  type        = map(string)
  default     = {}
}

variable "uptimekuma" {
  description = "Map containing all Uptime Kuma App configuration"
  type        = map(string)
  default     = {}
}

variable "portainer" {
  description = "Map containing all Portainer App configuration"
  type        = map(string)
  default     = {}
}

variable "pihole" {
  description = "Map containing all PiHole App configuration"
  type        = map(string)
  default     = {}
}

variable "bitwarden" {
  description = "Map containing all Bitwarden configuration"
  type        = map(string)
  default     = {}
}

variable "ssh" {
  description = "Map containing all SSH Tunnel configuration"
  type        = map(string)
  default     = {}
}

variable "backend" {
  description = "Map containing all Backend configuration"
  type        = map(string)
  default     = {}
}

variable "docuseal" {
  description = "Map containing all docuseal configuration"
  type        = map(string)
  default     = {}
}
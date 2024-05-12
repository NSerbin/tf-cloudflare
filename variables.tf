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

variable "raspberry_pi" {
  description = "Map containing all unified configuration for Raspberry Pi"
  type        = map(string)
  default     = {}
}

variable "sendgrid_em" {
  description = "Map containing all unified configuration for SendGrid EM"
  type        = map(string)
  default     = {}
}

variable "sendgrid_url" {
  description = "Map containing all unified configuration for SendGrid"
  type        = map(string)
  default     = {}
}

variable "sendgrid_domainkey" {
  description = "Map containing all unified configuration for SendGrid"
  type        = map(string)
  default     = {}
}

variable "sendgrid" {
  description = "Map containing all unified configuration for SendGrid"
  type        = map(string)
  default     = {}
}

variable "dns_records" {
  description = "Map containing all default dns records configuration"
  type        = map(string)
  default     = {}
}
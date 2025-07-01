variable "hcloud_token" {
  type = string
}

variable "cf_email" {
  description = "Cloudflare email"
  type        = string
  default = "admin@devops.kiev.ua"
}

variable "cf_api_key" {
  description = "Cloudflare api key"
  type        = string
}

variable "zone_id" {
  description = "Cloudflare zone id"
}
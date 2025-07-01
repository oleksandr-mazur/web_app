terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.23.0"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

provider "cloudflare" {
  email   = var.cf_email
  api_key = var.cf_api_key
}

resource "hcloud_ssh_key" "ssh" {
  name       = "key"
  public_key = file("~/.ssh/id_rsa.pub")
}
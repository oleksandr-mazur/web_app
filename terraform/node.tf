resource "hcloud_server" "web" {
  name        = "web"
  server_type = local.server_type
  image       = local.image
  location    = local.location
  user_data   = file("${path.module}/userdata/data.sh")

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }

  firewall_ids = [
    hcloud_firewall.allow_ssh_trusted.id,
    hcloud_firewall.allow_http_https.id,
  ]

  ssh_keys = [
    hcloud_ssh_key.ssh.id
  ]
}

resource "cloudflare_record" "devops_kyiv_ntfy" {
  zone_id = var.zone_id
  name    = "web"
  value   = hcloud_server.web.ipv4_address
  type    = "A"
  proxied = false
}

output "host_ip" {
  description = "Host ip"
  value = {
    endpoint = "ssh web@${hcloud_server.web.ipv4_address} -p 22"
  }
}
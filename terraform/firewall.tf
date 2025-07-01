# allow https connection from trusted ip, see locals.tf
resource "hcloud_firewall" "allow_http_https" {
  name = "allow_http_https_web"
  rule {
    direction  = "in"
    protocol   = local.tcp_protocol
    port       = local.https_port
    source_ips = local.all_ips
  }
  rule {
    direction  = "in"
    protocol   = local.tcp_protocol
    port       = local.http_port
    source_ips = local.all_ips
  }
}

# allow ssh connection from trusted ip, see locals.tf
resource "hcloud_firewall" "allow_ssh_trusted" {
  name = "allow_ssh_trusted_web"
  rule {
    direction  = "in"
    protocol   = local.tcp_protocol
    port       = local.ssh_port
    source_ips = local.trusted_ips
  }
  rule {
    direction  = "in"
    protocol   = local.tcp_protocol
    port       = 2200
    source_ips = local.trusted_ips
  }
}



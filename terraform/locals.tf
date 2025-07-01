locals {
  http_port     = 80
  https_port    = 443
  all_ips       = ["0.0.0.0/0", "::/0"]
  ssh_port      = 22
  tcp_protocol  = "tcp"
  udp_protocol  = "udp"
  any_protocol  = "-1"
  network_zone = "eu-central"

  image         = "ubuntu-24.04"
  server_type   = "cx22"

  home_ips       = ["188.190.241.155/32"]
  trusted_ips    = concat(local.home_ips)

  location = "nbg1"
}
provider "scaleway" {
  organization = "${var.organization}"
  token        = "${var.token}"
  region       = "ams1"
}

resource "scaleway_ip" "ip" {
	server= "${scaleway_server.scw_angry_burnell.id}"
}

data "scaleway_image" "scw_angry_burnell" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "scw_angry_burnell" {
  name  = "scw_angry_burnell"
  public_ip = "51.15.87.149"
  image = "${data.scaleway_image.scw_angry_burnell.id}"
  type  = "START1-S"

}


resource "scaleway_security_group" "http" {
  name        = "http"
  description = "allow HTTP and HTTPS traffic"
}

resource "scaleway_security_group_rule" "http_accept" {
  security_group = "${scaleway_security_group.http.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 80
}

resource "scaleway_security_group_rule" "https_accept" {
  security_group = "${scaleway_security_group.http.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}
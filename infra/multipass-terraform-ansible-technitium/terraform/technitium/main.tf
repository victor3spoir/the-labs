resource "technitium_zone" "multipass" {
  name = "multipass"
  type = "Forwarder"


}

resource "technitium_record" "multipass_forwarder" {
  zone               = technitium_zone.multipass.name
  name               = technitium_zone.multipass.name
  type               = "FWD"
  value              = "10.96.7.1"
  protocol           = "Udp"
  forwarder_priority = 0
  overwrite          = false
}


resource "technitium_zone" "lab" {
  name = "lab.victor3spoir.de"
  type = "Primary"
}

resource "technitium_record" "lab_wildcard" {
  zone      = technitium_zone.lab.name
  name      = "*"
  type      = "CNAME"
  value     = "srv-gateway.multipass."
  ttl       = 3600
  overwrite = false
}
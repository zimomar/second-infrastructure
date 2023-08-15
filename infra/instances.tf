resource "digitalocean_vpc" "vpc01" {
  name                  = "vpc01"
  region                = "fra1"
  ip_range              = "192.168.50.0/24"
}

resource "digitalocean_droplet" "s0" {
  image                 = "debian-12-x64"
  name                  = "s0.infra"
  region                = "fra1"
  size                  = "s-1vcpu-1gb"
  monitoring            = true
  ssh_keys              = ["39094407"]
  vpc_uuid              = digitalocean_vpc.vpc01.id
}

resource "digitalocean_droplet" "s1" {
  image                 = "debian-12-x64"
  name                  = "s1.infra"
  region                = "fra1"
  size                  = "s-1vcpu-1gb"
  monitoring            = true
  ssh_keys              = ["39094407"]
  vpc_uuid              = digitalocean_vpc.vpc01.id
}

resource "digitalocean_droplet" "s2" {
  image                 = "debian-12-x64"
  name                  = "s2.infra"
  region                = "fra1"
  size                  = "s-1vcpu-1gb"
  monitoring            = true
  ssh_keys              = ["39094407"]
  vpc_uuid              = digitalocean_vpc.vpc01.id
}

resource "digitalocean_droplet" "s3" {
  image                 = "debian-12-x64"
  name                  = "s3.infra"
  region                = "fra1"
  size                  = "s-1vcpu-1gb"
  monitoring            = true
  ssh_keys              = ["39094407"]
  vpc_uuid              = digitalocean_vpc.vpc01.id
}

resource "digitalocean_droplet" "s4" {
  image                 = "debian-12-x64"
  name                  = "s4.infra"
  region                = "fra1"
  size                  = "s-1vcpu-1gb"
  monitoring            = true
  ssh_keys              = ["39094407"]
  vpc_uuid              = digitalocean_vpc.vpc01.id
}

resource "digitalocean_firewall" "basic_fw" {
  name                  = "basic-fw"
  droplet_ids           = [digitalocean_droplet.s0.id, digitalocean_droplet.s1.id, digitalocean_droplet.s2.id,
    digitalocean_droplet.s3.id, digitalocean_droplet.s4.id]

  inbound_rule {
    protocol            = "tcp"
    port_range          = "80"
    source_addresses    = ["0.0.0.0/0", "::/0"]
  }

#  inbound_rule {
#    protocol            = "tcp"
#    port_range          = "1-65535"
#    source_addresses    = ["192.168.50.0/24"]
#  }

  inbound_rule {
    protocol            = "tcp"
    port_range          = "22"
    source_addresses    = ["109.18.226.32/32", "89.87.89.179/32", "83.202.17.247"] # Omar, Mamadou, Allan
  }

  inbound_rule {
    protocol            = "tcp"
    port_range          = "3306"
    source_addresses    = ["109.18.226.32/32", "89.87.89.179/32", "83.202.17.247"] # Omar, Mamadou, Allan
  }
}

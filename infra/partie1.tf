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
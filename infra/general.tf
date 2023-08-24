terraform {
  required_providers {
    digitalocean        = {
      source            = "digitalocean/digitalocean"
      version           = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token                 = var.do_token
}

resource "digitalocean_vpc" "vpc01" {
  name                  = "vpc01"
  region                = "fra1"
  ip_range              = "192.168.50.0/24"
}
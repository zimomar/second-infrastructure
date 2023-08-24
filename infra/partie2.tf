resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name                  = "dolibarr-cluster"
  region                = "fra1"
  version               = "1.27.4-do.0"

  node_pool {
    name                = "dolibarr-pool"
    size                = "s-1vcpu-2gb"
    node_count          = 3
  }
}

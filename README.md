# Devops project part 2
Devops part 2 project consisting on deploying dolibarr instance with its load balancer and database by using kubernetes

## Local launch

If not already done, install [minikube and kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-minikube/)

Start minikube cluster
```
minikube delete
minikube start --driver=docker
```
Modify the file `./mariadb-credential-secret.yaml` and replace the `MARIADB_ROOT_PASSWORD`

```
kubectl apply -f .
```
Provision dolibarr persistent volume
```
kubectl cp dolibarr-html/ {dolibarr-pod-id}:/var/www/html/
kubectl exec -it {dolibarr-pod-id} -- bash

# Inside the dolibarr pod
cd /var/www/html
mv dolibarr-html/* . && rm -r dolibarr-html
```

Expose load-balancer service locally
```
minikube service load-balancer --url
```

## Cloud launch
Since we are using DigitalOcean, install and configure [doctl](https://docs.digitalocean.com/reference/doctl/how-to/install/)
 and [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Install [kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)

Create `infra/secrets.tf`, looking like this :

```
variable "do_token" {
  default               = digital_ocean_account_token
}
variable "pvt_key" {
  default               = ssh_private_key_location
}

data "digitalocean_ssh_key" "digital_ocean_pem" {
  name                  = name_of_the_exported_key
}
```

Once done, init and apply the infrastructure

```
cd infra
teraform init
terraform apply
```

Once the apply is done, import the digitalocean kubernetes cluster and apply the config
```
doctl kubernetes cluster kubeconfig save ${digital_ocean_kubernetes_cluster_id}
kubectl apply -f .
```

Provision dolibarr persistent volume
```
kubectl cp dolibarr-html/ {dolibarr-pod-id}:/var/www/html/
kubectl exec -it {dolibarr-pod-id} -- bash

# Inside the dolibarr pod
cd /var/www/html
mv dolibarr-html/* . && rm -r dolibarr-html
```

Get load-balancer service's external ip
```
kubectl get svc/load-balancer
# NAME               TYPE              CLUSTER-IP        EXTERNAL-IP  PORT(S)        AGE
# ...
# load-balancer      LoadBalancer      10.10.10.10       1.2.3.4      80:31283/TCP   19h
```

Now go to browser and access to `http://1.2.3.4/` 
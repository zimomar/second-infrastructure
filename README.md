# second-infrastructure

## Launch kubernetes cluster
```
minikube delete
minikube start --driver=docker
```

## Apply kubernetes config
```
kubectl apply -f .
```

### provision dolibarr volume
```
kubectl cp dolibarr-html/* {dolibarr-pod-id}:/var/www/html/
```

### Expose dolibarr servide
```
minikube service dolibarr --url
```

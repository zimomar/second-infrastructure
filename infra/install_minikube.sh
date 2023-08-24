#!/bin/bash

# Install dependencies
apt update && apt install docker.io curl

# Kubectl installation
curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Minikube installation
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
mkdir -p /usr/local/bin/ && install minikube /usr/local/bin/

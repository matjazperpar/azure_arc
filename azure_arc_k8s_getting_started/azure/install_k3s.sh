#!/bin/bash

sudo apt-get update

# Install Rancer K3s single master cluster using k3sup
ADMINUSER=`awk -F: 'END { print $1}' /etc/passwd`
sudo -u "$ADMINUSER" mkdir /home/"$ADMINUSER"/.kube
curl -sLS https://get.k3sup.dev | sh
sudo cp k3sup /usr/local/bin/k3sup
sudo k3sup install --local --context arck3sdemo --local-path /home/"$ADMINUSER"/.kube
sudo chmod 644 /etc/rancher/k3s/k3s.yaml


# sudo cp /var/lib/waagent/custom-script/download/0/kubeconfig ~/.kube/config ## Need to see if can be changed to just kubeconfig


# Install Helm 3
sudo snap install helm --classic

# Install Azure CLI
sudo apt-get update
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

curl https://arcgettingstarted.blob.core.windows.net/az-extentions/connectedk8s-0.1.3-py2.py3-none-any.whl --output connectedk8s-0.1.3-py2.py3-none-any.whl
curl https://arcgettingstarted.blob.core.windows.net/az-extentions/k8sconfiguration-0.1.6-py2.py3-none-any.whl --output k8sconfiguration-0.1.6-py2.py3-none-any.whl
az extension add --source ./connectedk8s-0.1.3-py2.py3-none-any.whl --yes
az extension add --source ./k8sconfiguration-0.1.6-py2.py3-none-any.whl --yes

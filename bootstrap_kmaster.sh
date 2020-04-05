#!/bin/bash

echo "[TASK 1] Initialize Kubernetes Cluster"
POD_NETWORK_CIDR="10.244.0.0/16"
SERVICE_CIDR="10.96.0.0/12"
kubeadm init --apiserver-advertise-address=192.168.40.5 --pod-network-cidr=$POD_NETWORK_CIDR --service-cidr=$SERVICE_CIDR

echo "[TASK 2] Copy kube admin config to Vagrant user .kube directory"
mkdir /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

echo "[TASK 3] Deploy Calico network"
su - vagrant -c "kubectl create -f https://docs.projectcalico.org/v3.13/manifests/calico.yaml"


echo "[TASK 4] Generate and save cluster join command"
kubeadm token create --print-join-command 2>/dev/null  > /home/vagrant/joincluster.sh
chown -R vagrant:vagrant /home/vagrant/joincluster.sh
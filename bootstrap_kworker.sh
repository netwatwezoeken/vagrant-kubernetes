#!/bin/bash

# Join worker nodes to the Kubernetes cluster
echo "[TASK 1] Join node to Kubernetes Cluster"
apt-get  install -y sshpass >/dev/null 2>&1
#sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no kmaster.example.com:/joincluster.sh /joincluster.sh 2>/dev/null
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@192.168.40.5:~/joincluster.sh /joincluster.sh
bash /joincluster.sh

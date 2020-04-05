#!/bin/sh

echo 'Setting static IP address for Hyper-V...'

cat << EOF > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses: [$1/24]
      gateway4: 192.168.40.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
EOF
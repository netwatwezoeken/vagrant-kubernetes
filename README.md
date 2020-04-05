Have vagrant installed

`cd packer`

Download packer here or make sure it is in the `PATH`

`packer build ubuntu-18.04-amd64.json`

Install vragrant

`vagrant box add builds\ubuntu-18.04.hyperv.box --name ubuntu-k8s`

Install the vagrant reload plugin

`vagrant plugin install vagrant-reload`

`cd ..`


`vagrant up`


`vagrant destroy -f`

# On the master

`kubectl label node kworker1 node-role.kubernetes.io/worker=true`

apt-get update
apt-get install iputils-ping
apt-get install iproute2
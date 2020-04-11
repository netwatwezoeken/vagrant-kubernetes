For more information, please read the blog at https://blog.netwatwezoeken.nl/automated-kubernetes-installation-on-hyper-v/

## Prerequisites 

* Hyper-V enabled 
* [Packer](https://packer.io/)  
* [Vagrant](https://www.vagrantup.com/) 

## Usage

Clone this repo and open a terminal in it.

`cd packer`

Make sure the packer.exe is in `PATH` or located in this folder. Then run:

`packer build ubuntu-18.04-amd64.json`

Then wait for packer to complete the operation. This might take a while....

When the image is completed, add it to vagrant:
`vagrant box add builds\ubuntu-18.04.hyperv.box --name ubuntu-k8s-docker`

Install the vagrant reload plugin

`vagrant plugin install vagrant-reload`

`cd ..`

`vagrant up`

## cleanup

`vagrant destroy`
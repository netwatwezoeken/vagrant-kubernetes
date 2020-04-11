ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  # Kubernetes Master Server
  config.vm.define "k8smaster" do |k8smaster|
	k8smaster.trigger.before :reload do |trigger|
		trigger.info = "Setting Hyper-V switch to 'NAT Switch 192.168.40.x' to allow for static IP..."
		trigger.run = {privileged: "true", powershell_elevated_interactive: "true", path: "set-hyperv-switch.ps1", args: "k8smaster"}
	end
	
    k8smaster.vm.box = "ubuntu-k8s-docker"
    k8smaster.vm.hostname = "k8smaster.example.com"
    k8smaster.vm.provider "hyperv" do |v|
      v.vmname = "k8smaster"
      v.memory = 4096
      v.cpus = 2
    end
	k8smaster.vm.synced_folder ".", "/vagrant", disabled: true
    k8smaster.vm.provision "shell", path: "configure-static-ip.sh", args: "192.168.40.5"
	k8smaster.vm.provision :reload
	k8smaster.vm.provision "shell", path: "bootstrap_kmaster.sh"
  end

  NodeCount = 2

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "kworker#{i}" do |workernode|
	  workernode.trigger.before :reload do |trigger|
		trigger.info = "Setting Hyper-V switch to 'NAT Switch 192.168.40.x' to allow for static IP..."
		trigger.run = {privileged: "true", powershell_elevated_interactive: "true", path: "set-hyperv-switch.ps1", args: "kworker#{i}"}
	  end
	  workernode.vm.box = "ubuntu-k8s-docker"
      workernode.vm.hostname = "kworker#{i}.example.com"
      workernode.vm.provider "hyperv" do |v|
        v.vmname = "kworker#{i}"
        v.memory = 2048
        v.cpus = 1
      end
      workernode.vm.synced_folder ".", "/vagrant", disabled: true
      workernode.vm.provision "shell", path: "configure-static-ip.sh", args: "192.168.40.5#{i}"
      workernode.vm.provision :reload
      workernode.vm.provision "shell", path: "bootstrap_kworker.sh"
    end
  end
  
end

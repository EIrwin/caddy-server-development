VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  #Assign Box and VM Properties
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  
  # Network
  config.vm.network "forwarded_port", guest:80, host: 8080
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest:56789, host:56789

  
  # Provision
  config.vm.provision :shell, inline: "sudo apt-get update"
  #config.vm.provision :shell, path: "scripts/provision_java.sh"
  #config.vm.provision :shell, path: "scripts/provision_jenkins.sh"
  config.vm.provision :docker
  config.vm.provision :shell, path: "scripts/provision_docker-compose.sh"
  
end
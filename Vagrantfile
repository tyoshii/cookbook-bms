# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Box
  config.vm.box     = "bms"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v0.1.0/centos64-x86_64-20131030.box"

  # Network
  config.vm.network :private_network, ip: "192.168.50.10"

  # Boot Timeout
  config.vm.boot_timeout = 3000

  # SSH
  config.ssh.forward_agent = true

  # Chef-Omnibus
  config.omnibus.chef_version = "11.6.0"

  # Berkshelf
  config.berkshelf.enabled = true

  # vagrant-cachier plugin
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
  end
end


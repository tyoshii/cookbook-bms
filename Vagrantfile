# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Box
  config.vm.box     = 'bms'
  config.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box'

  # Network
  config.vm.network :private_network, ip: '192.168.50.10'

  # Boot Timeout
  config.vm.boot_timeout = 3000

  # SSH
  config.ssh.forward_agent = true

  # Chef-Omnibus
  config.omnibus.chef_version = '11.6.0'

  # Berkshelf
  config.berkshelf.enabled = true

  # vagrant-cachier plugin
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :machine
  end

  # Provision
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      'recipe[cookbook-bms::default]'
    ]
  end
end

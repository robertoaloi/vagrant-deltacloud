Vagrant::Config.run do |config|

  # Use lucid32 box from Vagrant
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  # Port forwarding (port 22 forwarded by default to 2222)
  config.vm.forward_port 3001, 3001
  config.vm.network :hostonly, "33.33.33.10"

  # config.vm.boot_mode = :gui

  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = "cookbooks"

    chef.add_recipe("apt")
    chef.add_recipe("deltacloud")

  end

end

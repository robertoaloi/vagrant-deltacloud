Vagrant::Config.run do |config|

  # Use precise64 box from Vagrant
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Port forwarding (port 22 forwarded by default to 2222)
  config.vm.forward_port 3001, 3001
  config.vm.network :hostonly, "33.33.33.10"

  # config.vm.boot_mode = :gui

  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = "cookbooks"

    chef.json = {
        "deltacloud" => {
            "hostname" => "33.33.33.10",
            "port"     => 3001,
            "driver"   => "mock",
            "logfile"  => "daemon.log",
            "bin_path" => "/usr/local/bin"
        }
    }

    chef.add_recipe("apt")
    chef.add_recipe("deltacloud")

    # chef.log_level = :debug

  end

end

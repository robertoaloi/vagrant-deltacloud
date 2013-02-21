# README

This Vagrant VM provides you with a ready-to-go Deltacloud Server.

By default, the server will start with the following parameters:

**Parameter** | **Default value**
--- | ---
Hostname | "33.33.33.10"
Port | 3001
Driver | "mock"

You can edit the Vagrantfile to specify alternative values for the above parameters. For example, to start the deltacloud daemon with the EC2 driver, simply add the following to the Vagrantfile:

    chef.json = {
        "deltacloud" => {
            "driver"   => "ec2"
        }
    }

## Quickstart

    git clone git://github.com/prof3ta/vagrant-deltacloud.git
    cd vagrant-deltacloud
    vagrant up

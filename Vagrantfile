# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "centos65"
    config.vm.box_url = "https://s3-ap-northeast-1.amazonaws.com/aozora-boxes/CentOS-6.4-x86.box"
    #config.vm.network :public_network, ip: "192.168.1.91"
    config.vm.network :private_network, ip: "192.168.33.30"
    config.vm.synced_folder "./html", "/var/www/html", mount_options: ['dmode=777', 'fmode=666']

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
        vb.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0]
    end

    config.vm.provision :ansible do |ansible|
        ansible.playbook = "./provision.yml"
        ansible.inventory_path = "./hosts"
        ansible.limit = 'all'
        ansible.extra_vars = {
            apache: {
                root: "/var/www/html"
            },
            nginx: {
                root: "/usr/share/nginx"
            },
            fastcgi: {
                pass: "/var/run/php-fpm/www.sock"
            },
            ansible: {
                root: "/usr/share/nginx"
            }
        }
    end

end

# Custom Vagrant Config
#
# NOTE: Specify 'SSH_KEY_TYPE', 'SSH_PRIVATE_KEY', 'SSH_PUBLIC_KEY' and 'ROLES' during provisioning\n\n"
ANSIBLE_PULL_REPOSITORY_PLAYBOOK = ENV['ANSIBLE_PULL_REPOSITORY_PLAYBOOK'] ? ENV['ANSIBLE_PULL_REPOSITORY_PLAYBOOK'] : ''
ROLES = ENV['ROLES'] ? ENV['ROLES'] : ''

system('if [ ! -d "ssh" ]; then tar -C ~/ .ssh/ -zc | tar -xz ; mv .ssh ssh ; fi')

if ENV['ANSIBLE_PULL_REPOSITORY_PLAYBOOK']
else
    puts "NO ANSIBLE_PULL_REPOSITORY_PLAYBOOK GIVEN... ASSUME WE ARE RUNNING ALREADY EXISTING"
end
if ENV['ROLES']
else
    puts "NO ROLES GIVEN... ASSUME WE ARE RUNNING ALREADY EXISTING"
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
  config.vm.box_url = "https://atlas.hashicorp.com/puppetlabs/ubuntu-14.04-64-nocm/versions/1.0.1/providers/virtualbox.box"
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "512"]
    if ENV['EXTRA_DISK_MB']
        puts "CREATING HDD"
        disk_name = 'extra_disk'
        if ENV['EXTRA_DISK_FILENAME']
            disk_name = ENV['EXTRA_DISK_FILENAME']
        end
        vb.customize ['createhd', '--filename', disk_name + '.vdi', '--size', ENV['EXTRA_DISK_MB'].to_i * 1024]
        vb.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk_name + '.vdi']
    end
  end

  config.vm.provision :shell, :inline => 'ANSIBLE_PULL_REPOSITORY_PLAYBOOK=\'' + ANSIBLE_PULL_REPOSITORY_PLAYBOOK + '\' ROLES="' + ROLES + '" /vagrant/vagrant-bootstrap'
end

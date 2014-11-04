# Custom Vagrant Config
#
# NOTE: Specify 'SSH_KEY_TYPE', 'SSH_PRIVATE_KEY', 'SSH_PUBLIC_KEY' and 'ROLES' during provisioning\n\n"

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.name = "gittest"
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :shell, :inline => 'ANSIBLE_PULL_REPOSITORY=\'' + ENV['ANSIBLE_PULL_REPOSITORY'] + '\' ROLES="' + ENV['ROLES'] + '" /vagrant/vagrant-bootstrap'
end

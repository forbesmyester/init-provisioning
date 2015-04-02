# Custom Vagrant Config
#
# NOTE: Specify 'SSH_KEY_TYPE', 'SSH_PRIVATE_KEY', 'SSH_PUBLIC_KEY' and 'ROLES' during provisioning\n\n"
ANSIBLE_PULL_REPOSITORY_PLAYBOOK = ENV['ANSIBLE_PULL_REPOSITORY_PLAYBOOK'] ? ENV['ANSIBLE_PULL_REPOSITORY_PLAYBOOK'] : ''
ROLES = ENV['ROLES'] ? ENV['ROLES'] : ''

system('if [ ! -d "ssh" ]; then mkdir ssh && cp ~/.ssh/known_hosts ssh; fi')

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
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true # See https://coderwall.com/p/p3bj2a/cloning-from-github-in-vagrant-using-ssh-agent-forwarding
  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :shell, :inline => 'ANSIBLE_PULL_REPOSITORY_PLAYBOOK=\'' + ANSIBLE_PULL_REPOSITORY_PLAYBOOK + '\' ROLES="' + ROLES + '" /vagrant/vagrant-bootstrap'
end

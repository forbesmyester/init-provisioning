# Vagrant Initialization Scripts

These scripts are designed for starting Vagrant boxes using `ansible-pull` internally but also doing work such as copying SSH keys etc and installing Ansible. They did used to work with Docker and I may make them do this again, but it's not something I'm too interested in fixing right now.

To use these scripts you need to run vagrant with environmental variables like the following:

    ANSIBLE_PULL_REPOSITORY_PLAYBOOK='git@github.com:forbesmyester/provisioning-common.git::terminal_developer,gui_developer' ROLES=developer vagrant up

In this command `ANSIBLE_PULL_REPOSITORY_PLAYBOOK` includes a list of repositories and playbooks and ROLES defines a list of roles that the machine should have.


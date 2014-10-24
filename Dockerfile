FROM ubuntu:14.04
MAINTAINER YOUR_NAME

ENV ROLES english

RUN useradd -m -s /bin/bash ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-ubuntu_no_password
RUN sudo su ubuntu -c "mkdir ~/add-files"
ADD configure-ansible /home/ubuntu/add-files/configure-ansible
RUN /home/ubuntu/add-files/configure-ansible

# RUN su ubuntu -c '[ ! -d ~/.ssh ] && mkdir ~/.ssh'
ADD ssh_keys /home/ubuntu/.ssh
RUN chown -Rc ubuntu:ubuntu /home/ubuntu/.ssh/
RUN chmod -Rc 600 /home/ubuntu/.ssh
RUN chmod 700 /home/ubuntu/.ssh

# Uncomment the following for cool provisioning...
# RUN sudo su ubuntu -c "ansible-playbook -c local playbook.yml"

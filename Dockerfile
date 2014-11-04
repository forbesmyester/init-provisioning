FROM ubuntu:14.04
MAINTAINER YOUR_NAME

ENV ROLES common
ENV ANSIBLE_PULL_REPOSITORY 'git@github.com:forbesmyester/provisioning-common.git'

RUN useradd -m -s /bin/bash ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-ubuntu_no_password
RUN su ubuntu -c "mkdir ~/add-files"

# RUN su ubuntu -c '[ ! -d ~/.ssh ] && mkdir ~/.ssh'
ADD ssh /home/ubuntu/.ssh
RUN chown -Rc ubuntu:ubuntu /home/ubuntu/.ssh/
RUN chmod -Rc 700 /home/ubuntu/.ssh
RUN chmod 600 /home/ubuntu/.ssh/*

ADD configure-ansible /home/ubuntu/add-files/configure-ansible
RUN /home/ubuntu/add-files/configure-ansible
RUN sudo su ubuntu -c echo $USER $X $Y $Z
ADD run-ansible /home/ubuntu/add-files/run-ansible
RUN su ubuntu -c /home/ubuntu/add-files/run-ansible

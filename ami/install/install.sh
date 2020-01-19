#!/bin/bash
# See https://github.com/arunvdsharma/openshift-centos/blob/master/install-tools.sh

## Default variables to use

# install updates
sudo yum update -y

# install the following base packages
sudo yum install -y  wget git net-tools docker-1.13.1\
				bind-utils iptables-services \
				bridge-utils \
				kexec-tools sos psacct openssl-devel \
				httpd-tools NetworkManager \
				python-cryptography python2-pip python-devel python-passlib

#install epel
sudo yum -y install epel-release

# Disable the EPEL repository globally so that is not accidentally used during later steps of the installation
sudo sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

sudo systemctl | grep "NetworkManager.*running"
if [ $? -eq 1 ]; then
	sudo systemctl start NetworkManager
	sudo systemctl enable NetworkManager
fi

# install the packages for Ansible
sudo yum -y --enablerepo=epel install pyOpenSSL

#curl -o ansible.rpm https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.6.5-1.el7.ans.noarch.rpm
#sudo yum -y --enablerepo=epel install ansible.rpm

sudo yum -y --enablerepo=epel install https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.6.5-1.el7.ans.noarch.rpm

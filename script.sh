#!/bin/bash
# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done
# install ansible
sudo apt-get update
sudo apt-get -y install ansible

#install jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update 
sudo apt -y install jenkins

# make sure ansible and jenkins are started
sudo systemclt start ansible
sudo systemclt start jenkins

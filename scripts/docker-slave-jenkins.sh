#!/bin/bash
sudo apt update
sudo apt install docker.io -y
sudo su - 
usermod -aG docker jenkins
usermod -aG docker ubuntu
systemctl restart docker

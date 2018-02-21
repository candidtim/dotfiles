#!/bin/bash

# install Amazon Linux specific packages
sudo yum -y install epel-release
sudo yum-config-manager --enable epel
sudo yum -y install less curl python36 python36-pip vim git zsh gcc-c++ make the_silver_searcher

# install nodejs
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install nodejs

# install common packages and files
bash install-common.sh

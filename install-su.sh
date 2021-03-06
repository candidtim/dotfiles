#!/bin/bash

# install some packages
apt update
apt -y install curl python3-pip vim vim-gtk git zsh silversearcher-ag \
  npm feh build-essential cmake tmux gnome-tweaks
pip3 install virtualenvwrapper
npm install -g diff-so-fancy

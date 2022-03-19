#!/bin/bash

# install some packages
apt update
apt -y install curl python3-pip vim vim-gtk git tig zsh silversearcher-ag \
  npm feh build-essential cmake tmux gnome-tweaks exuberant-ctags
pip3 install virtualenvwrapper
npm install -g diff-so-fancy

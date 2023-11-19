#!/bin/bash

# install some packages
apt update
apt -y install curl python3-pip python3-venv \
  vim neovim git tig zsh silversearcher-ag \
  npm feh build-essential cmake tmux gnome-tweaks exuberant-ctags golang \
  cowsay
pip3 install virtualenvwrapper
npm install -g diff-so-fancy

# set up the compose key
sed -i 's/^XKBOPTIONS.*/XKBOPTIONS="compose:ralt"/' /etc/default/keyboard

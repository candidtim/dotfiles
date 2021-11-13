#!/bin/bash

# Enable RPM Fusion
dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Upgrade
dnf check-update
dnf upgrade
dnf autoremove

# Install "missing" packages
dnf install -y make automake gcc gcc-c++ kernel-devel \
  ncurses-devel \
  util-linux-user zsh fzf \
  levien-inconsolata-fonts \
  vim-enhanced gvim the_silver_searcher powerline-fonts \
  git-gui gitk tig \
  npm \
  gnome-tweak-tool gnome-themes-extra arc-theme \
  vlc shutter \
  dropbox nautilus-dropbox \
  alacritty


pip install virtualenvwrapper

npm install -g diff-so-fancy

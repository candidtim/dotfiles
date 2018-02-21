#!/bin/bash

# install Ubuntu specific packages
sudo apt -y install curl python-pip vim vim-gtk git zsh silversearcher-ag npm feh build-essential cmake

# install nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

# install common packages and files
bash install-common.sh

# install powerline fonts for vim-airline
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts/UbuntuMono

# i3wm
sudo apt -y install i3 i3blocks xbacklight arandr lxappearance rofi fonts-font-awesome
mkdir -p ~/.i3
cp ~/src/dotfiles/.i3/config ~/.i3
cp ~/src/dotfiles/.i3/i3blocks.conf ~/.i3

# reminders
echo Install solarized color scheme manually:
echo  - create new terminal profile 'Solarized'
echo  - configure it to use 'Ubuntu Mono Derivative Powerline' font
echo  - run 'bash ~/src/dotfiles/solarized-install.sh'

#!/bin/bash

# i3wm
sudo apt-get -y install i3 i3blocks xbacklight arandr lxappearance rofi fonts-font-awesome
mkdir -p ~/.i3
cp ~/src/dotfiles/.i3/config ~/.i3
cp ~/src/dotfiles/.i3/i3blocks.conf ~/.i3

#!/bin/bash

sudo apt-get -y install i3 i3blocks xbacklight arandr lxappearance rofi compton fonts-font-awesome

mkdir -p ~/.i3
cp ~/projects/dotfiles/.i3/config ~/.i3
cp ~/projects/dotfiles/.i3/i3blocks.conf ~/.i3

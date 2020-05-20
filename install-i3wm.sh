#!/bin/bash

sudo apt -y install i3 i3blocks xbacklight arandr lxappearance rofi \
  fonts-font-awesome
mkdir -p ~/.i3
cp ~/src/dotfiles/.i3/config ~/.i3
cp ~/src/dotfiles/.i3/i3blocks.conf ~/.i3

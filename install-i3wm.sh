#!/bin/bash

# install i3
sudo dnf install -y \
  i3 i3blocks i3lock xbacklight arandr rofi fonts-font-awesome feh dunst acpi

# copy conifgs
mkdir -p ~/.i3
cp ~/src/dotfiles/.i3/config ~/.i3
cp ~/src/dotfiles/.i3/i3blocks.conf ~/.i

# install i3blocks
i3blocks_build_dir=/tmp/i3blocks
git clone https://github.com/vivien/i3blocks $i3blocks_build_dir
pushd $i3blocks_build_dir
./autogen.sh
./configure
make
sudo make install
popd
rm -rf $i3blocks_build_dir

# install i3blocks scripts
git clone https://github.com/vivien/i3blocks-contrib.git ~/.i3/contrib

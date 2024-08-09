#!/bin/bash

cp -f ~/.allshrc .
cp -f ~/.bash_aliases .
cp -f ~/.bash_functions .
cp -f ~/.ctags .
cp -f ~/.gitconfig .
cp -f ~/.gitignore .
cp -f ~/.tmux.colors.light.conf .
cp -f ~/.tmux.colors.dark.conf .
cp -f ~/.tmux.conf .
cp -f ~/.config/nvim/init.vim ./.config/nvim/
cp -f ~/.config/nvim/lua/init.lua ./.config/nvim/lua/
cp -f ~/.oh-my-zsh/themes/candidtim.zsh-theme ./.oh-my-zsh/themes

sed -i '' '/user/,+2d' .gitconfig

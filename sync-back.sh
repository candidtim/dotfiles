#!/bin/bash

pushd ~/src/dotfiles

cp -f ~/.alacritty.yml .
cp -f ~/.allshrc .
cp -f ~/.bash_aliases .
cp -f ~/.bash_functions .
cp -f ~/.ctags .
cp -f ~/.gitconfig .
cp -f ~/.gitignore .
cp -f ~/.gvimrc .
cp -f ~/.ideavimrc .
cp -f ~/.tmux.colours.conf .
cp -f ~/.tmux.conf .
cp -f ~/.tmux.project .
cp -f ~/.vimrc .
cp -f ~/.xinitrc .
cp -f ~/.zshrc .
cp -f ~/.oh-my-zsh/themes/candidtim.zsh-theme ./.oh-my-zsh/themes

sed -i '/user/,+2d' .gitconfig

popd

#!/bin/bash

pushd ~/src/dotfiles

cp -f ~/.alacritty.yml .
# .. and remove Mac adjustments
sed -i '' 's#program: /bin/zsh#program: /usr/bin/zsh#' .alacritty.yml
sed -i '' 's#Roboto Mono Light for Powerline#Ubuntu Mono derivative Powerline#' .alacritty.yml
sed -i '' 's#Light#Regular#' .alacritty.yml
sed -i '' 's#size: 16.0#size: 14.0#' .alacritty.yml
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
cp -f ~/.oh-my-zsh/themes/candidtim.zsh-theme ./.oh-my-zsh/themes

sed -i '' '/user/,+2d' .gitconfig

popd

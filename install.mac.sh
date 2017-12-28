#!/bin/bash

# install packages
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
# TODO: compile vim with lua
brew install vim macvim zsh fzf tmux

# oh-my-zsh
# curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# basic directories
mkdir -p ~/app ~/src ~/temp

# install dotfiles
# git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
cp ~/src/dotfiles/.bash_aliases ~
cp ~/src/dotfiles/.bash_functions ~
cp ~/src/dotfiles/.ctags ~
cp ~/src/dotfiles/.gitconfig ~
cp ~/src/dotfiles/.gitignore ~
cp ~/src/dotfiles/.vimrc ~
cp ~/src/dotfiles/.tmux.conf ~
cp ~/src/dotfiles/.tmux.project ~
cp ~/src/dotfiles/.gvimrc ~
cp ~/src/dotfiles/.vimabbr ~
cp ~/src/dotfiles/.zshrc ~
cp ~/src/dotfiles/.allshrc ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# vim
# .. create vim directories
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vimswap ~/.vimbackup
# .. install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# .. install plugins
vim +PluginInstall +qall
./install.py --all
# .. install powerline fonts for vim-airline
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# tmux
mkdir -p ~/.tmux/bundle
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/bundle/tmux-resurrect

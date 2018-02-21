#!/bin/bash

# update npm
sudo npm install npm@latest -g

# install packages
sudo npm install -g diff-so-fancy
sudo pip install virtualenvwrapper

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# basic directories
mkdir -p ~/app ~/src ~/temp

# install dotfiles
git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
cp ~/src/dotfiles/.bash_aliases ~
cp ~/src/dotfiles/.bash_functions ~
cp ~/src/dotfiles/.ctags ~
cp ~/src/dotfiles/.gitconfig ~
cp ~/src/dotfiles/.gitignore ~
cp ~/src/dotfiles/.vimrc ~
cp ~/src/dotfiles/.gvimrc ~
cp ~/src/dotfiles/.tmux.conf ~
cp ~/src/dotfiles/.tmux.project ~
cp ~/src/dotfiles/.vimabbr ~
cp ~/src/dotfiles/.zshrc ~
cp ~/src/dotfiles/.allshrc ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# vim
# .. create vim directories
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vimswap ~/.vimbackup
# .. install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# .. install plugins
vim +PluginInstall +qall

# tmux
mkdir -p ~/.tmux/bundle
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/bundle/tmux-resurrect

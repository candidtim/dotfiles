#!/bin/bash

# install packages
sudo apt-get -y install curl python-pip vim vim-gtk xclip

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh

# virtualenv wrapper
sudo pip install virtualenvwrapper

# generate new ssh key
ssh-keygen -t rsa
echo New public key:
cat ~/.ssh/id_rsa.pub | xclip
echo -- END --

# basic directories
mkdir ~/app
mkdir ~/projects
mkdir ~/temp

# install dotfiles
git clone https://github.com/candidtim/dotfiles.git ~/projects/dotfiles
cp ~/projects/dotfiles/.bash_aliases ~
cp ~/projects/dotfiles/.bash_functions ~
cp ~/projects/dotfiles/.gitconfig ~
cp ~/projects/dotfiles/.vimrc ~
cp ~/projects/dotfiles/.zshrc ~
cp ~/projects/dotfiles/.allshrc ~
cp ~/projects/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# install vim plugins
bash ~/projects/dotfiles/vim-install.sh

# reminders
echo Install solarized color scheme manually:
echo  - create new terminal profile 'Solarized'
echo  - configure it to use 'Ubuntu Mono Derivative Powerline' font
echo  - run 'bash ~/projects/dotfiles/solarized-install.sh'

#!/bin/bash

# install packages
sudo apt-get -y install curl python-pip vim vim-gtk git zsh silversearcher-ag npm feh build-essential cmake
sudo pip install virtualenvwrapper
sudo npm install -g diff-so-fancy

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# basic directories
mkdir -p ~/app ~/projects ~/temp

# install dotfiles
git clone https://github.com/candidtim/dotfiles.git ~/projects/dotfiles
cp ~/projects/dotfiles/.bash_aliases ~
cp ~/projects/dotfiles/.bash_functions ~
cp ~/projects/dotfiles/.ctags ~
cp ~/projects/dotfiles/.gitconfig ~
cp ~/projects/dotfiles/.gitignore ~
cp ~/projects/dotfiles/.vimrc ~
cp ~/projects/dotfiles/.tmux.conf ~
cp ~/projects/dotfiles/.tmux.project ~
cp ~/projects/dotfiles/.gvimrc ~
cp ~/projects/dotfiles/.vimabbr ~
cp ~/projects/dotfiles/.zshrc ~
cp ~/projects/dotfiles/.allshrc ~
cp ~/projects/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# vim
# .. create vim directories
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vimswap ~/.vimbackup
# .. install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# .. install plugins
vim +PluginInstall +qall
# .. compile YCM with all lanaguages support
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
# .. install powerline fonts for vim-airline
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts/UbuntuMono

# i3wm
sudo apt-get -y install i3 i3blocks xbacklight arandr lxappearance rofi fonts-font-awesome
mkdir -p ~/.i3
cp ~/projects/dotfiles/.i3/config ~/.i3
cp ~/projects/dotfiles/.i3/i3blocks.conf ~/.i3

# reminders
echo Install solarized color scheme manually:
echo  - create new terminal profile 'Solarized'
echo  - configure it to use 'Ubuntu Mono Derivative Powerline' font
echo  - run 'bash ~/projects/dotfiles/solarized-install.sh'

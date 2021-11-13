#!/bin/bash

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# basic directories
mkdir -p ~/app ~/src ~/tmp ~/bin ~/.marks ~/.config

# install dotfiles
cp ~/src/dotfiles/.allshrc ~
cp ~/src/dotfiles/.bash_aliases ~
cp ~/src/dotfiles/.bash_functions ~
cp ~/src/dotfiles/.ctags ~
cp ~/src/dotfiles/.gitconfig ~
cp ~/src/dotfiles/.gitignore ~
cp ~/src/dotfiles/.gvimrc ~
cp ~/src/dotfiles/.ideavimrc ~
cp ~/src/dotfiles/.tmux.colours.conf ~
cp ~/src/dotfiles/.tmux.conf ~
cp ~/src/dotfiles/.tmux.project ~
cp ~/src/dotfiles/.vimrc ~
cp ~/src/dotfiles/.xinitrc ~
cp ~/src/dotfiles/.Xmodmap ~
cp ~/src/dotfiles/.zshrc ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
cp ~/src/dotfiles/.alacritty.yml ~
cp .config/redshift.conf ~/.config
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# copy custom bin scripts
cp ~/src/dotfiles/bin/* ~/bin

# vim
# .. create vim directories
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vimswap ~/.vimbackup
# .. install Vundle
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# .. install plugins
vim +PluginInstall +qall

# tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# reminders
echo Install solarized color scheme manually:
echo  - create new terminal profile 'Solarized'
echo  - configure it to use 'Inconsolata Regular' font
echo  - run '~/src/dotfiles/solarized-install.sh'

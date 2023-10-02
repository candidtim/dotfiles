#!/bin/bash

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# basic directories
mkdir -p ~/app ~/src ~/tmp ~/bin ~/.marks ~/.config

# install dotfiles
cp ~/src/dotfiles/.alacritty.yml ~
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
cp ~/src/dotfiles/.zshrc ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# copy custom bin scripts
cp ~/src/dotfiles/bin/* ~/bin

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# vim
# .. create vim directories
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vimswap ~/.vimbackup
# .. install Vundle
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# .. install Vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# .. install plugins
vim +PluginInstall +qall
# .. install powerline fonts for vim-airline
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts/UbuntuMono

# tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# dircolors
mkdir ~/.solarized
wget -O ~/.solarized/dircolors https://raw.githubusercontent.com/huyz/dircolors-solarized/master/dircolors.ansi-dark

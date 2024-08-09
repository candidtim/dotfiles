#!/bin/bash

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# Create commonly-used directories
mkdir -p ~/app ~/src ~/tmp ~/bin ~/.config

# Copy dotfiles
cp ~/src/dotfiles/.alacritty.yml ~
cp ~/src/dotfiles/.allshrc ~
cp ~/src/dotfiles/.bash_aliases ~
cp ~/src/dotfiles/.gitconfig ~
cp ~/src/dotfiles/.gitignore ~
cp ~/src/dotfiles/.tmux.colors.light.conf ~
cp ~/src/dotfiles/.tmux.colors.dark.conf ~
cp ~/src/dotfiles/.tmux.conf ~
cp -r ~/src/dotfiles/.config ~
cp ~/src/dotfiles/.zshrc ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
touch ~/.shlocal

# Copy custom bin scripts
cp ~/src/dotfiles/bin/* ~/bin

# Configure fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Configure nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall

# Configure tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Python apps
source ~/src/dotfiles/install-py.sh

# Install fonts
mkdir -p ~/.local/share/fonts
git clone https://github.com/githubnext/monaspace.git ~/tmp/monaspace
pushd ~/tmp/montaspace && bash util/install_linux.sh && popd
fc-cache ~/.local/share/fonts
rm -rf ~/tmp/monaspace

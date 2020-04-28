#!/bin/bash

# install some packages
sudo apt-get -y install curl python-pip vim vim-gtk git zsh silversearcher-ag npm feh build-essential cmake
sudo pip install virtualenvwrapper
sudo npm install -g diff-so-fancy

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)

# basic directories
mkdir -p ~/app ~/src ~/tmp

# install dotfiles
git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
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
# .. compile YCM with all lanaguages support
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
# .. install powerline fonts for vim-airline
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts/UbuntuMono

# emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
mv ~/.doom.d ~/.doom.d.bak
cp -f ~/src/dotfiles/.doom.d/* ~/.doom.d/
~/.emacs.d/bin/doom refresh


# tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# reminders
echo Install solarized color scheme manually:
echo  - create new terminal profile 'Solarized'
echo  - configure it to use 'Ubuntu Mono Derivative Powerline' font
echo  - run '~/src/dotfiles/solarized-install.sh'
echo ""
echo "If you want, install i3wm with '~/src/dotfiles/install-i3wm.sh'"

#!/bin/bash

# Install XCode CLI tools
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
brew install git tig ctags fzf diff-so-fancy tmux python pipx sbcl rlwrap
brew install --cask neovim font-menlo-for-powerline meld

# Install JDK
brew tap homebrew/cask-versions
brew install --cask temurin8
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 8)' >> ~/.shlocal

# Create commonly-used directories
mkdir ~/src ~/tmp ~/app ~/bin

# Copy dotfiles
cp ~/src/dotfiles/.allshrc ~
cp ~/src/dotfiles/.bash_aliases ~
cp ~/src/dotfiles/.bash_functions ~
cp ~/src/dotfiles/.ctags ~
cp ~/src/dotfiles/.gitconfig ~
cp ~/src/dotfiles/.gitignore ~
cp ~/src/dotfiles/.tmux.colors.light.conf ~
cp ~/src/dotfiles/.tmux.colors.dark.conf ~
cp ~/src/dotfiles/.tmux.conf ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
echo "source ${HOME}/.allshrc" >> ~/.bashrc
echo "source ${HOME}/.allshrc" >> ~/.zshrc
touch ~/.shlocal

# Configure zsh
echo 'ZSH_THEME="candidtim"' >> ~/.zshrc
echo 'unsetopt share_history' >> ~/.zshrc
echo 'bindkey -v' >> ~/.zshrc
echo 'export KEYTIMEOUT=1' >> ~/.zshrc

# Copy custom bin scripts
cp ~/src/dotfiles/bin/* ~/bin

# Configure nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall

# Configure tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Python apps
source ~/src/dotfiles/install-py.sh

echo "To do:"
echo "- Add Homebrew dir to path (see instructions printed by Homebrew above)"
echo "- Install tmux plugins with prefix+I"
echo "- Change System Preferences:"
echo "  - Keyboard: key repeat fast, delay before repeat shortest."

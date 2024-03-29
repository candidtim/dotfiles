#!/bin/bash

# Install XCode CLI tools
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
brew install git tig ctags fzf diff-so-fancy tmux python pipenv poetry
brew install --cask macvim neovim font-menlo-for-powerline meld

# Install JDK
brew tap homebrew/cask-versions
brew install --cask temurin8
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 8)' >> ~/.shlocal

# Create commonly-used directories
mkdir ~/src ~/tmp ~/app ~/bin

# Copy dotfiles
cp ~/src/dotfiles/.alacritty.yml ~
# .. and adjust for Mac
sed -i '' 's#program: /usr/bin/zsh#program: /bin/zsh#' ~/.alacritty.yml
sed -i '' 's#Ubuntu Mono derivative Powerline#Roboto Mono Light for Powerline#' ~/.alacritty.yml
sed -i '' 's#Regular#Light#' ~/.alacritty.yml
sed -i '' 's#size: 14.0#size: 16.0#' ~/.alacritty.yml
cp ~/src/dotfiles/.allshrc ~
cp ~/src/dotfiles/.bash_aliases ~
cp ~/src/dotfiles/.bash_functions ~
cp ~/src/dotfiles/.ctags ~
cp ~/src/dotfiles/.gitconfig ~
cp ~/src/dotfiles/.gitignore ~
cp ~/src/dotfiles/.gvimrc ~
# .. and adjust for Mac
sed -i '' 's#set gfn=Ubuntu\\ Mono\\ derivative\\ Powerline\\ 13#set gfn=Roboto\\ Mono\\ Light\\ for\\ Powerline:h16#' .gvimrc
cp ~/src/dotfiles/.ideavimrc ~
cp ~/src/dotfiles/.tmux.colours.conf ~
cp ~/src/dotfiles/.tmux.conf ~
cp ~/src/dotfiles/.tmux.project ~
cp ~/src/dotfiles/.vimrc ~
cp ~/src/dotfiles/.oh-my-zsh/themes/candidtim.zsh-theme ~/.oh-my-zsh/themes
touch ~/.shlocal
echo "source ${HOME}/.allshrc" >> ~/.bashrc
echo "source ${HOME}/.allshrc" >> ~/.zshrc
# .. and adjust zshrc for Mac
echo 'ZSH_THEME="candidtim"' >> ~/.zshrc
echo 'unsetopt share_history' >> ~/.zshrc
echo 'bindkey -v' >> ~/.zshrc
echo 'export KEYTIMEOUT=1' >> ~/.zshrc

# Configure Vim
# .. create vim directories
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vimswap ~/.vimbackup
# .. install Vundle
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# .. install Vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# .. install plugins
vim +PluginInstall +qall

# Configure tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "To do:"
echo "- Add Homebrew dir to path (see instructions printed by Homebrew above)"
echo "- Start tmux plugins with prefix+I"
echo "- Change System Preferences:"
echo "  - Keyboard: key repeat fast, delay before repeat shortest."
echo "- Install YCM for Vim ('python install.sh' in the YCM plugin dir)"
echo "- If using Python: 'brew install black isort flake8'"
echo "- If using Common Lisp: 'brew install sbcl rlwrap' and './install-lisp.sh'"

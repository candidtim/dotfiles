# dotfiles

.bashrc, .zshrc, .vimrc and the company

## Fresh install

    apt install git
    mkdir ~/src
    git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
    cd ~/src/dotfiles
    cat install-su.sh | sudo bash
    source install.sh

## Install tmux plugins

Start `tmux` and type "Prefix + I"

## Manual changes

Enable sudo password feedback:

 - Show `sudo` password as you type: `sudo visudo` and add `pwfeedback` after
   `env_reset` (comma-separated)

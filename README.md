# dotfiles

.bashrc, .zshrc, .vimrc and the company

## Fresh install - MacOS

Prerequisites:

 - [iTerm2](https://iterm2.com/)
 - XCode CLI tools: `xcode-select --install`
 - [Homebrew](https://brew.sh/)
 - Git: `brew install git`

Installation:

    mkdir ~/src
    git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
    cd ~/src/dotfiles
    ./install-mac.sh

Configuration:

 - Install tmux plugins with Prefix+I
 - Change System Preferences:
    - Keyboard: key repeat fast, delay before repeat shortest

## Fresh install - Linux

Installation:

    apt install git
    mkdir ~/src
    git clone https://github.com/candidtim/dotfiles.git ~/src/dotfiles
    cd ~/src/dotfiles
    cat install-linux-su.sh | sudo bash
    ./install-linux.sh

Configuration:

 - Install tmux plugins with Prefix+I
 - Enable sudo password feedback: `sudo visudo` and add `pwfeedback` after
   `env_reset` (comma-separated)

## Keeping the dotfiles up to date

To sync local dotfiles back to the repository: './sync-back-mac.sh' or
`./sync-back-linux.sh`.

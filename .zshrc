ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candidtim"

bindkey -v
export KEYTIMEOUT=1
eval `dircolors ~/.solarized/dircolors`

plugins=(git mvn colorize command-not-found themes vagrant docker sudo web-search wd)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

source "${HOME}/.allshrc"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

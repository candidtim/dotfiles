ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candidtim"

bindkey -v
eval `dircolors ~/.solarized/dircolors`

plugins=(git colorize command-not-found themes vagrant docker lwd sudo wd)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

source "${HOME}/.allshrc"

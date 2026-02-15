ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candidtim"

plugins=(git colorize sudo vi-mode)
source $ZSH/oh-my-zsh.sh

unsetopt share_history
bindkey -v
export KEYTIMEOUT=1

source "${HOME}/.allshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

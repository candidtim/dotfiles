ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candidtim"

bindkey -v
export KEYTIMEOUT=1
eval `dircolors ~/.solarized/dircolors`

plugins=(git mvn colorize command-not-found themes vagrant docker sudo web-search wd)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

source "${HOME}/.bash_aliases"
source "${HOME}/.bash_functions"

if [ -f "${HOME}/.shlocal" ]; then
  source "${HOME}/.shlocal"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

~/pprojects/hnfetch/hnfetch.py | cowthink -n

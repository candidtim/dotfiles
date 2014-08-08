ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candidtim"

bindkey -v
unsetopt share_history
eval `dircolors ~/.solarized/dircolors`

plugins=(git mvn colorize command-not-found themes gradle vagrant docker jira lwd sudo web-search wd)

source $ZSH/oh-my-zsh.sh

source "${HOME}/.bash_aliases"
source "${HOME}/.bash_functions"

if [ -f "${HOME}/.shlocal" ]; then
  source "${HOME}/.shlocal"
fi

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candidtim"

plugins=(git mvn colorize themes wd sudo)

source $ZSH/oh-my-zsh.sh

source "${HOME}/.bash_aliases"
source "${HOME}/.bash_functions"

if [ -f "${HOME}/.path" ]; then
  source "${HOME}/.path"
fi

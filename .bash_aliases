# interactive operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep
alias grep='grep --color'

# ls
alias ls='ls -hF --color=auto'
alias ll='ls -Al'
alias lt='ls -rtl'
alias l=ls

# nvim
alias vim=nvim
alias vi=nvim
alias v=nvim
alias vw='vi +VimwikiIndex'

# git
alias g=git
alias gg='git st'
alias gdf='git diff --color | diff-so-fancy | less'
alias gdc='git diff --cached --color | diff-so-fancy | less'
alias gdt='git difftool'
alias gpl='git pull --rebase'
alias tiga='tig --all'

# tmux
alias tm='tmux list-sessions 2>/dev/null | grep "0:" && tmux attach-session -t 0 || tmux'

# python
alias po='poetry'

# lisp
alias cl='rlwrap sbcl'
# sawnk server for vlime
# (reminder: can disable debugger with --disable-debugger)
alias swank='rlwrap sbcl --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'

# make
alias mk=make

# docker
alias dk=docker
alias dc="docker compose"

# kubernetes
alias k=kubectl
alias kcgc='kubectl config get-contexts'
alias kcuc='kubectl config use-context'

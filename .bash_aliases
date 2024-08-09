# interactive operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ls
alias ls='ls -hF --color=auto'
alias ll='ls -Al'
alias lt='ls -rtl'
alias l=ls

# common find operations
alias lf='find . -name'

# Vim
alias vim=nvim
alias vi=nvim
alias v=nvim

# git
alias g=git
alias gg='git st'
alias gk='gitk&'
alias gka='gitk --all&'
alias gdf='git diff --color | diff-so-fancy | less'
alias gdc='git diff --cached --color | diff-so-fancy | less'
alias gdt='git difftool'
alias gpl='git pull --rebase'
alias tiga='tig --all'

# ctags
alias ct='ctags -R .'

# tmux
alias tm='tmux list-sessions 2>/dev/null | grep "0:" && tmux attach-session -t 0 || tmux'
alias tls='tmux list-sessions'
alias ta='tmux attach -t'

# python
alias py=python
alias py3=python3
alias activate='source venv/bin/activate'

# lisp
alias cl='rlwrap sbcl'
# sawnk server for vlime
# (reminder: can disable debugger with --disable-debugger)
alias swank='rlwrap sbcl --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'

# make
alias mk=make

# vagrant
alias vg=vagrant

# terraform
alias tf=terraform

# "docker"
alias dk=docker
alias dc="docker compose"
alias dkillall="docker ps -a && docker ps -a -q | xargs docker rm -f && docker ps -a"

# kubernetes
alias k=kubectl
alias mmk='microk8s kubectl'
alias kcgc='kubectl config get-contexts'
alias kcuc='kubectl config use-context'

# beep
export BEEP=/usr/share/sounds/ubuntu/stereo/service-login.ogg
alias beep='paplay $BEEP'

# nautilus
alias nautilus='nautilus --no-desktop'
alias nau=nautilus

# xclip to copy to clipboard by default
alias clip='xclip -i -selection clipboard'

# network manager
alias ns='nmcli connection show'
alias nu='nmcli connection up'
alias nd='nmcli connection down'

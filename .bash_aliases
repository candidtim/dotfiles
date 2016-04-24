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
alias l=ls

# common find operations
alias lf='find . -name'

# tmux with correct colors
alias tmux="TERM=screen-256color-bce tmux"

# NeoVim
alias nv=nvim

# git
alias g=git
alias gg='git st'
alias gk='gitk&'
alias gka='gitk --all&'
alias gdf='git diff --color | diff-so-fancy | less'
alias gdc='git diff --cached --color | diff-so-fancy | less'
alias gdt='git difftool'
alias gs='git stash list | cat'
function gsa { git stash apply "stash@{$1}" }

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# python
alias py=python
alias py3=python3
alias ve=virtualenv

# gradle
alias gr=gradle

# make
alias mk=make

# vagrant
alias vg=vagrant

# docker
alias dk=docker
alias dkillall="docker ps -a && docker ps -a -q | xargs docker rm -f && docker ps -a"

# beep
export BEEP=/usr/share/sounds/ubuntu/stereo/service-login.ogg
alias beep='paplay $BEEP'
alias alert='notify-send "$([ $? = 0 ] && echo Done || echo ERROR)" && beep'

# nautilus
alias nau=nautilus

# desktop controls
alias susp="lock && systemctl suspend"

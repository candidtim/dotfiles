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
alias gdf='git diff --color -- ":!*.lock" | diff-so-fancy | less'
alias gdc='git diff --cached --color -- ":!*.lock" | diff-so-fancy | less'
alias gdt='git difftool'
alias gpl='git pull --rebase'
alias tiga='tig --all'
alias gka='gitk --all &'
alias gk='gitk &'

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

# docker / podman
if [[ "$(uname)" == "Darwin" ]]; then
  alias dk=docker
  alias dc="docker compose"
else
  alias dk=podman
  alias dc="podman compose"
fi

# kubernetes
alias k=kubectl
alias kcgc='kubectl config get-contexts'
alias kcuc='kubectl config use-context'

# devcontainer shim to support podman, adds "stop" and "down" commands:
devcontainer() {

    # docker/podman switch:
    local dockercli
    if [[ "$(uname)" == "Darwin" ]]; then
        dockercli=docker
    else
        dockercli=podman
    fi

    # 'stop' and 'down' commands:
    if [[ "$1" == "stop" || "$1" == "down" ]]; then
        local hostname
        hostname=$(command devcontainer exec --docker-path $dockercli hostname)
        $dockercli stop "$hostname"
        if [[ "$1" == "down" ]]; then
            $dockercli rm "$hostname"
        fi

    # proxy other commands (up, exec, etc.):
    else
        local args=("$1" "--docker-path" "$dockercli")
        shift
        args+=("$@")
        command devcontainer "${args[@]}"
    fi
}
alias dev=devcontainer

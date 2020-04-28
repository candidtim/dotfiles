COLOR_TIME="%{$fg[yellow]%}"
COLOR_CWD="%{$fg[cyan]%}"
COLOR_BRANCH="%{$fg[green]%}"

COLOR_GIT_OK="%{$fg[green]%}"
COLOR_GIT_NOK="%{$fg[red]%}"

COLOR_ERROR="%{$fg[red]%}"

COLOR_NONE="%{$reset_color%}"


# git_prompt_info, used in prompt below
ZSH_THEME_GIT_PROMPT_PREFIX="$COLOR_NONE:$COLOR_BRANCH"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""

local RETURNCODE="%(?..${COLOR_ERROR} %?${COLOR_NONE})"

PROMPT="$COLOR_TIME%T $COLOR_CWD%~\$(git_prompt_info)$COLOR_NONE$RETURNCODE λ "

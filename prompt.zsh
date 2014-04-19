
blue="%{$fg[blue]%}"
green="%{$fg[green]%}"
red="%{$fg[red]%}"
white="%{$fg[white]%}"
reset="%{$reset_color%}"

# PROMPT="${blue}%c => ${reset}"
# RPROMPT="${green}%M [%D{%H:%M:%S}]${reset}"

ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[white]‹ %{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_STAGED="${green}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_SUFFIX=" $fg_bold[white]›%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_AHEAD="↑$n"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="aheadr"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="BEHINDr"
ZSH_THEME_GIT_PROMPT_CLEAN="clear"
ZSH_THEME_GIT_PROMPT_DELETED="-"
ZSH_THEME_GIT_PROMPT_DIRTY="..."
ZSH_THEME_GIT_PROMPT_DIVERGED="↕"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="divR"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_RENAMED="renamed"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=":"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=":"
ZSH_THEME_GIT_PROMPT_STASHED=">"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_UNMERGED="✖"

ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${white}●"

PROMPT=$'%{${fg[cyan]}%}%B%~%b$(git_prompt_string)%{${fg[default]}%} '

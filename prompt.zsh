
blue="%{$fg[blue]%}"
green="%{$fg[green]%}"
red="%{$fg[red]%}"
reset="%{$reset_color%}"

# PROMPT="${blue}%c => ${reset}"
# RPROMPT="${green}%M [%D{%H:%M:%S}]${reset}"


# # Default values for the appearance of the prompt. Configure at will.
# ZSH_THEME_GIT_PROMPT_PREFIX="("
# ZSH_THEME_GIT_PROMPT_SUFFIX=")"
# ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
# ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}●"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}✖"
# ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}✚"
# ZSH_THEME_GIT_PROMPT_REMOTE=""
# ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# # First Arrow
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$bg[yellow]%}%{$fg[blue]%}⮀ "
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$bg[yellow]%}%{$fg[yellow]%}"
 
# # Branch Name
# ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[black]%}"
# ZSH_THEME_GIT_PROMPT_REMOTE="%{$bg[yellow]%} %{$bg[green]%}%{$fg[black]%}"
# ZSH_THEME_GIT_PROMPT_SEPARATOR=""
 
# # Repo Status
# ZSH_THEME_GIT_PROMPT_STAGED="%{$bg[magenta]%}%{$fg[black]%}●"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$bg[red]%}%{$fg[black]%}✖"
# ZSH_THEME_GIT_PROMPT_CHANGED="%{$bg[red]%}%{$fg[black]%}+"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$bg[cyan]%}%{$fg[black]%}…"
# ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[white]‹ %{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_STAGED="${green}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_SUFFIX=" $fg_bold[white]›%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="aheadr"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="BEHINDr"
ZSH_THEME_GIT_PROMPT_CLEAN="clear"
ZSH_THEME_GIT_PROMPT_DELETED="-"
ZSH_THEME_GIT_PROMPT_DIRTY="..."
ZSH_THEME_GIT_PROMPT_DIVERGED="↕"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="divR"
ZSH_THEME_GIT_PROMPT_MODIFIED="●"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_RENAMED="renamed"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=":"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=":"
ZSH_THEME_GIT_PROMPT_STASHED=">"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_UNMERGED="✖"
ZSH_THEME_GIT_PROMPT_UNTRACKED="untracked"

PROMPT=$'%{${fg[cyan]}%}%B%~%b$(git_prompt_status)%{${fg[default]}%} '

b="%{$fg[blue]%}"
g="%{$fg[green]%}"
c="%{$fg[cyan]%}"
r="%{$fg[red]%}"
y="%{$fg[yellow]%}"
w="%{$fg[white]%}"
m="%{$fg[magenta]%}"
res="%{$reset_color%}"


# PROMPT="${blue}%c => ${reset}"
# RPROMPT="${green}%M [%D{%H:%M:%S}]${reset}"

# ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[white]‹ %{$fg_bold[yellow]%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
# ZSH_THEME_GIT_PROMPT_STAGED="${green}●"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
# ZSH_THEME_GIT_PROMPT_SUFFIX=" $fg_bold[white]›%{$reset_color%}"

# ZSH_THEME_GIT_PROMPT_ADDED="+"
# ZSH_THEME_GIT_PROMPT_AHEAD="↑n"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="aheadr"
# ZSH_THEME_GIT_PROMPT_BEHIND="↓"
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="BEHINDr"
# ZSH_THEME_GIT_PROMPT_CLEAN="clear"
# ZSH_THEME_GIT_PROMPT_DELETED="-"
# ZSH_THEME_GIT_PROMPT_DIRTY="..."
# ZSH_THEME_GIT_PROMPT_DIVERGED="↕"
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="divR"
# ZSH_THEME_GIT_PROMPT_PREFIX="("
# ZSH_THEME_GIT_PROMPT_RENAMED="renamed"
# ZSH_THEME_GIT_PROMPT_SHA_AFTER=":"
# ZSH_THEME_GIT_PROMPT_SHA_BEFORE=":"
# ZSH_THEME_GIT_PROMPT_STASHED=">"
# ZSH_THEME_GIT_PROMPT_SUFFIX=")"
# ZSH_THEME_GIT_PROMPT_UNMERGED="✖"

# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[red]%}●"
# ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="${white}●"

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL=""
GIT_PROMPT_PREFIX="${b}[${res}"
GIT_PROMPT_SUFFIX="${b}]${res}"
GIT_PROMPT_AHEAD="${r}↑NUM${res}"
GIT_PROMPT_BEHIND="${c}↓NUM${res}"
GIT_PROMPT_MERGING="${m}⚡︎${res}"
GIT_PROMPT_UNTRACKED="${r}●${res}"
GIT_PROMPT_MODIFIED="${y}●${res}"
GIT_PROMPT_STAGED="${g}●${res}"

PROMPT=$'${b}%B%~%b$(git_prompt_string)%{${fg[default]}%} '

# PROMPT=$'%{$fg[white]%} %{$fg_bold[cyan]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[cyan]%}%D{[%I:%M:%S]} %{$fg_bold[green]%}%n$%{$reset_color%} '





blue="%{$fg[blue]%}"
green="%{$fg[green]%}"
red="%{$fg[red]%}"
reset="%{$reset_color%}"

c2=$bwhite
c3=$grey
PROMPT="${blue}%c => ${reset}"
RPROMPT="${green}%M [%D{%H:%M:%S}]${reset}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
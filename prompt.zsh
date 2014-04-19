
# blue="%{$fg[blue]%}"
# green="%{$fg[green]%}"
# red="%{$fg[red]%}"
# reset="%{$reset_color%}"

# c2=$bwhite
# c3=$grey
# PROMPT="${blue}%c => ${reset}"
# RPROMPT="${green}%M [%D{%H:%M:%S}]${reset}"

# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
# ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""


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
 
# # Prompt
# PROMPT='%{$bg[blue]%}%{$fg[black]%} %c %{$fg[blue]%}$(git_super_status)%{$bg[black]%}⮀%{$reset_color%} '

# Initialize colors.
autoload -U colors
colors
 
# Allow for functions in the prompt.
setopt PROMPT_SUBST
# Autoload zsh functions.
fpath=($ZSH_CUSTOM/plugins/otter/functions $fpath)
autoload -U $ZSH_CUSTOM/plugins/otter/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'
 
# Set the prompt.
PROMPT=$'%{${fg[cyan]}%}%B%~%b$(git_prompt_info)%{${fg[default]}%} '
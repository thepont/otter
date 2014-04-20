b="%{$fg[blue]%}"
bl="%{$fg[black]%}"
g="%{$fg[green]%}"
c="%{$fg[cyan]%}"
r="%{$fg[red]%}"
y="%{$fg[yellow]%}"
w="%{$fg[white]%}"
m="%{$fg[magenta]%}"

_b="%{$bg[blue]%}"
_g="%{$bg[green]%}"
_c="%{$bg[cyan]%}"
_r="%{$bg[red]%}"
_y="%{$bg[yellow]%}"
_w="%{$bg[white]%}"
_m="%{$bg[magenta]%}"

res="%{$reset_color%}"



# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${ZSH_THEME_GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${ZSH_THEME_GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$ZSH_THEME_GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$ZSH_THEME_GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$ZSH_THEME_GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$ZSH_THEME_GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$GIT_STATE$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_info() {
	local git_where="$(parse_git_branch)"
	[ -n "$git_where" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX$(parse_git_state)"
}

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}



# Modify the colors and symbols in these variables as desired.
ZSH_THEME_GIT_PROMPT_PREFIX="${b}[${g}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${b}]${res}"
ZSH_THEME_GIT_PROMPT_AHEAD="${r}⬆ NUM${res}"
ZSH_THEME_GIT_PROMPT_BEHIND="${g}⬇ NUM${res}"
ZSH_THEME_GIT_PROMPT_MERGING="${m}✕${res}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${r}●${res}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${y}●${res}"
ZSH_THEME_GIT_PROMPT_STAGED="${g}●${res}"

PROMPT=$'${b}%c$(git_prompt_info) ${b}=> ${res}'

# PROMPT="${b}%c$(my_git_prompt) ${b}=> ${res}"
RPROMPT="${green}%M [%D{%H:%M:%S}]${reset}"







# # Adapted from code found at <https://gist.github.com/1712320>.

# # setopt prompt_subst
# # autoload -U colors && colors # Enable colors in prompt







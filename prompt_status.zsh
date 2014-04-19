# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

# Set the right-hand prompt
# RPS1='$(git_prompt_string)'

# # Initialize colors.
# autoload -U colors
# colors

# # Allow for functions in the prompt.
# setopt PROMPT_SUBST

# autoload -U add-zsh-hook

# add-zsh-hook chpwd chpwd_update_git_vars
# add-zsh-hook preexec preexec_update_git_vars
# add-zsh-hook precmd precmd_update_git_vars

# # Default Vars
# DEFAULT_PREFIX="("
# DEFAULT_SUFFIX=")"
# DEFAULT_BRANCH=""
# DEFAULT_STAGED="●"
# DEFAULT_CONFLICTS="✖"
# DEFAULT_CHANGED="✚"
# DEFAULT_UNTRACKED="…"
# DEFAULT_AHEAD="↑"
# DEFAULT_BEHIND="↓"
# DEFAULT_DIVERGED="↕"

# ## Function definitions
# function preexec_update_git_vars() {
# 	case "$1" in 
# 		g*)
# 		__EXECUTED_GIT_COMMAND=1
# 		;;
# 	esac
# }

# function precmd_update_git_vars() {
#     if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
#     	update_current_git_vars
#     	unset __EXECUTED_GIT_COMMAND
#     fi
# }

# function chpwd_update_git_vars() {
#     update_current_git_vars
# }

# function update_current_git_vars() {
# 	unset __CURRENT_GIT_BRANCH
# 	unset __CURRENT_GIT_BRANCH_STATUS
# 	unset __CURRENT_GIT_BRANCH_IS_DIRTY

# 	local st="$(git status 2>/dev/null)"
# 	if [[ -n "$st" ]]; then
# 		local -a arr
# 		arr=(${(f)st})

# 		if [[ $arr[1] =~ 'Not currently on any branch.' ]]; then
# 			__CURRENT_GIT_BRANCH='no-branch'
# 		else
# 			__CURRENT_GIT_BRANCH="${arr[1][(w)4]}";
# 		fi

# 		if [[ $arr[2] =~ 'Your branch is' ]]; then
# 			if [[ $arr[2] =~ 'ahead' ]]; then
# 				__CURRENT_GIT_BRANCH_STATUS='ahead'
# 			elif [[ $arr[2] =~ 'diverged' ]]; then
# 				__CURRENT_GIT_BRANCH_STATUS='diverged'
# 			else
# 				__CURRENT_GIT_BRANCH_STATUS='behind'
# 			fi
# 		fi

# 		if [[ ! $st =~ 'nothing to commit' ]]; then
# 			__CURRENT_GIT_BRANCH_IS_DIRTY='1'
# 		fi
# 	fi
# }

# # get the difference between the local and remote branches
# git_remote_status() {
#     remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
#     if [[ -n ${remote} ]] ; then
#         ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
#         behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

#         if [ $ahead -eq 0 ] && [ $behind -gt 0 ]
#         then
#             echo "$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE"
#         elif [ $ahead -gt 0 ] && [ $behind -eq 0 ]
#         then
#             echo "$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE"
#         elif [ $ahead -gt 0 ] && [ $behind -gt 0 ]
#         then
#             echo "$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE"
#         fi
#         echo $ahead":"$behind
#     fi
# }

# prompt_git_info() {	
# 	if [ -n "$__CURRENT_GIT_BRANCH" ]; then
# 		local s=${GIT_PREFIX-$DEFAULT_PREFIX}
# 		s+=${GIT_BRANCH-$DEFAULT_BRANCH}"$__CURRENT_GIT_BRANCH"
# 		case "$__CURRENT_GIT_BRANCH_STATUS" in
# 			ahead)
# 			s+=${GIT_AHEAD-$DEFAULT_AHEAD}
# 			;;
# 			diverged)
# 			s+=${GIT_DIVERGED-$DEFAULT_DIVERGED}
# 			;;
# 			behind)
# 			s+=${GIT_BEHIND-$DEFAULT_BEHIND}
# 			;;
# 		esac
# 		if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
# 			s+=${GIT_UNTRACKED-$DEFAULT_UNTRACKED}
# 		fi
# 		s+=${GIT_SUFFIX-$DEFAULT_SUFFIX}
	 
# 		printf " %s%s" "%{${fg[yellow]}%}" $s
# 	fi
# 	echo "\n"
# 	echo "$__CURRENT_GIT_BRANCH"
# 	echo "$__CURRENT_GIT_BRANCH_STATUS"
# }


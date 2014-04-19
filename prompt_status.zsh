# Initialize colors.
autoload -U colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_git_vars
add-zsh-hook preexec preexec_update_git_vars
add-zsh-hook precmd precmd_update_git_vars

# Default Vars
DEFAULT_PREFIX="("
DEFAULT_SUFFIX=")"
DEFAULT_BRANCH=""
DEFAULT_STAGED="●"
DEFAULT_CONFLICTS="✖"
DEFAULT_CHANGED="✚"
DEFAULT_UNTRACKED="…"
DEFAULT_AHEAD="↑"
DEFAULT_BEHIND="↓"
DEFAULT_DIVERGED="↕"

## Function definitions
function preexec_update_git_vars() {
	case "$1" in 
		git*)
		__EXECUTED_GIT_COMMAND=1
		;;
	esac
}

function precmd_update_git_vars() {
    if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    	update_current_git_vars
    	unset __EXECUTED_GIT_COMMAND
    fi
}

function chpwd_update_git_vars() {
    update_current_git_vars
}

function update_current_git_vars() {
	unset __CURRENT_GIT_BRANCH
	unset __CURRENT_GIT_BRANCH_STATUS
	unset __CURRENT_GIT_BRANCH_IS_DIRTY

	local st="$(git status 2>/dev/null)"
	if [[ -n "$st" ]]; then
		local -a arr
		arr=(${(f)st})

		if [[ $arr[1] =~ 'Not currently on any branch.' ]]; then
			__CURRENT_GIT_BRANCH='no-branch'
		else
			__CURRENT_GIT_BRANCH="${arr[1][(w)4]}";
		fi

		if [[ $arr[2] =~ 'Your branch is' ]]; then
			if [[ $arr[2] =~ 'ahead' ]]; then
				__CURRENT_GIT_BRANCH_STATUS='ahead'
			elif [[ $arr[2] =~ 'diverged' ]]; then
				__CURRENT_GIT_BRANCH_STATUS='diverged'
			else
				__CURRENT_GIT_BRANCH_STATUS='behind'
			fi
		fi

		if [[ ! $st =~ 'nothing to commit' ]]; then
			__CURRENT_GIT_BRANCH_IS_DIRTY='1'
		fi
	fi
}

prompt_git_info() {	
	if [ -n "$__CURRENT_GIT_BRANCH" ]; then
		local s=${GIT_PREFIX-$DEFAULT_PREFIX}
		s+=${GIT_BRANCH-$DEFAULT_BRANCH}"$__CURRENT_GIT_BRANCH"
		case "$__CURRENT_GIT_BRANCH_STATUS" in
			ahead)
			s+=${GIT_AHEAD-$DEFAULT_AHEAD}
			;;
			diverged)
			s+=${GIT_DIVERGED-$DEFAULT_DIVERGED}
			;;
			behind)
			s+=${GIT_BEHIND-$DEFAULT_BEHIND}
			;;
		esac
		if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
			s+=${GIT_UNTRACKED-$DEFAULT_UNTRACKED}
		fi
		s+=${GIT_SUFFIX-$DEFAULT_SUFFIX}
	 
		printf " %s%s" "%{${fg[yellow]}%}" $s
	fi
	# echo "$__CURRENT_GIT_BRANCH"
	# echo "$__CURRENT_GIT_BRANCH_STATUS"
	# echo "$__CURRENT_GIT_BRANCH_IS_DIRTY"
}


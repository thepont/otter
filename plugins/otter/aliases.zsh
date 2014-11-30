
alias otter=$ZSH_CUSTOM

alias softlimit='ulimit -n 2048' 

#--------------------------------------------------------------------------
# Git
#--------------------------------------------------------------------------

alias g='git'

# Add all and commit with message
alias gc='git add -A :/ && git commit -am'

# Add all files from repo root.
alias ga='git add -A :/'

# Better Fetch
alias gf='git fetch -p'

# Hacky way to update Git
alias gg='g | clear'

# Amend files to last commit
alias gwhoops='git commit --amend -C HEAD'

alias grm='git update-index --assume-unchanged'

# Delete local and remote branch
function gdelete(){
    _MOD="$1"
    if [ -z "$_MOD" ]
    then
        echo "Please pass branch name"
    else
        git branch -d $_MOD && git push origin :$_MOD
    fi
}

#--------------------------------------------------------------------------
# NPM
#--------------------------------------------------------------------------

alias npml='npm list --depth=0'


#--------------------------------------------------------------------------
# Maven/Jetty shortcuts
#--------------------------------------------------------------------------

alias music='ncmpcpp'




#--------------------------------------------------------------------------
# Maven/Jetty shortcuts
#--------------------------------------------------------------------------

#run jetty
alias jrun='mvn jetty:run -o -Djava.awt.headless=true'

#run forked jetty
alias jfrun='mvn jetty:run-forked -o -Djava.awt.headless=true'

#kill the latest jetty instance
alias jkill='kill -9 `ps -e | grep jetty\:run | awk '"'"'{print $1}'"'"' | tail -1`'


#--------------------------------------------------------------------------
# Atlassian Stash
#--------------------------------------------------------------------------

# Create a pull request
alias pr='stash pull-request'


#--------------------------------------------------------------------------
# Bower
#--------------------------------------------------------------------------

# No Glob for ZSH usage
alias bower='noglob bower'

#--------------------------------------------------------------------------
# Tig
#--------------------------------------------------------------------------

alias t='tig'
alias tst='tig status'


#--------------------------------------------------------------------------
# oh-my-zsh
#--------------------------------------------------------------------------

# Edit Config
alias zc="$EDITOR ~/.zshrc"

# Reload Config
alias zr=". ~/.zshrc"

# Open ohmyzsh folder
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"


#--------------------------------------------------------------------------
# Misc
#--------------------------------------------------------------------------

# Kill a process
alias k='kill -9'

alias cello='say -v cellos "di di di di di di di di di di di di di di di di di di di di di di di di di di"'
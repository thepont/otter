#!zsh

#--------------------------------------------------------------------------
# A Cleaner Print of your current IP
#--------------------------------------------------------------------------

function ip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
    ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /'| awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /'| awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}	


#--------------------------------------------------------------------------
# super simple local php server
#--------------------------------------------------------------------------
#
# => serve hostname(localhost) port(8000)
#

function serve() {
    _HOST=${1-localhost}
    _PORT=${2-8000}
    php -S $_HOST:$_PORT -t .
}


#--------------------------------------------------------------------------
# unixify
#--------------------------------------------------------------------------
#
# Clean up MS-DOS line breaks
#

function unixify() {
    tr '\015' '\n' < ${1} >${2-output.txt}
}


#--------------------------------------------------------------------
# shell function to define words
#--------------------------------------------------------------------
#
# http://vikros.tumblr.com/post/23750050330/cute-little-function-time
# 
def() {
    if [[ $# -ge 2 ]] then
        echo "givedef: too many arguments" >&2
        return 1
    else
        curl "dict://dict.org/d:$1" | more
    fi
}


#--------------------------------------------------------------------
# display a neatly formatted path
#--------------------------------------------------------------------

path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

#--------------------------------------------------------------------
# any function from http://onethingwell.org/post/14669173541/any
# search for running processes
#--------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

#--------------------------------------------------------------------
# Sine Wave!
#--------------------------------------------------------------------
function sine_wave() {

    i=0
    while true
    do 
        SIN=$(python -c "from math import *;print map( lambda x: ceil(6*sin((x+$i)*pi/5)), range($(tput cols)) )" | tr -d '[]' | spark)
        echo -ne $SIN\\r 
        let i=i+1
        sleep 0.05
    done
    echo
}

#--------------------------------------------------------------------
# cssgrep
#--------------------------------------------------------------------

function cssgrep() {
    case "$2" in
    'leading')
        grep -n -r "0\.\d[^\.]" $1
    ;;
    esac
}


man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

function hipfile () {

    hip ping $1 "/code `cat $2`"

}
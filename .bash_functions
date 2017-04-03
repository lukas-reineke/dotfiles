# mkdir and enter
function mkcd {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo -e ${RED}"$* already exists"${NC}
        cs $1
    else
        mkdir -p $1 && cd $1
    fi
}

# cd git status
function cs {
    if [[ $# -eq 0 ]]; then
        builtin cd
    elif [[ -d "$*" ]]; then
        builtin cd "$*"
        if [ -d ./.git ]; then
            git_status_shortcuts
        fi
        if [ -f ./.env.sh ]; then
            source .env.sh
            echo -e '\n'${GRN}'#'${NC}' added '${PWD##*/}' environment variables\n'
        fi
    elif [[ -f "$*" ]]; then
        echo -e ${RED}"$* is not a directory"${NC} 1>&2
        local dir=$(dirname "$*")
        builtin cd "$dir"
    else
        builtin cd "$*"
    fi
}
alias cd='exec_scmb_expand_args cs'

# temp folder
function temp {
    if [ ! -n "$1" ]; then
        pushd $HOME/temp
    else
        pushd $HOME/temp
        if [ -d $1 ]; then
            printf "${RED}\`$1' already exists${NC}\n"  && cs $1
        else
            mkdir $1 && cs $1
        fi
    fi
}

#setup terminal tab title
function tt {
    if [ "$1" ]
    then
        unset PROMPT_COMMAND
        echo -ne "\033]0;${*}\007"
    else
        function title {
            echo -ne "\033]0;${PWD##*/}\007"
        }
        export PROMPT_COMMAND="title;$PROMPT_COMMAND"
    fi
}
tt

# cd ..
function ce {
    DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done;
}

# bower
function bower {
    if [[ $1 == "i" ]]; then
        command bower install "${@:2}"
    else
        command bower "$@"
    fi
}

# yarn
function yarn {
    if [[ $1 == "i" ]]; then
        command yarn add "${@:2}"
    else
        command yarn "$@"
    fi
}

#brew
function brew {
    if [[ $1 == "i" ]]; then
        command brew install "${@:2}"
    else
        command brew "$@"
    fi
}

# Create a ZIP archive of a file or folder.
function makezip {
    zip -r "${1%%/}.zip" "$1" ;
}

# Creates an archive (*.tar.gz) from given directory.
function maketar {
    tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

# Make directories and files access rights sane.
function sanitize {
    chmod -R u=rwX,g=rX,o= "$@" ;
}

# Display weather
function weather {
    curl -s "http://www.wunderground.com/global/stations/10147.html" | grep "og:title" | cut -d\" -f4 | sed 's/&deg;/ degrees C/';
}

# Generate random mac address
function mac {
    hexdump -n6 -e '/1 ":%02X"' /dev/random|sed s/^://g
    echo ""
}

# run ssh-agent and add key
function addssh {
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval `ssh-agent -s`
        ssh-add
    fi
}

# move to -old
function old {
    str="$1"
    if [ "${str: -1}" == "/" ]; then
        # str=${str::-1}
        str=${str%?}
    fi
    mv $str{,-old}
}

# copy to -bu
function bu {
    str="$1"
    if [ "${str: -1}" == "/" ]; then
        # str=${str::-1}
        str=${str%?}
    fi
    cp -r $str{,-bu}
}

# horizontal line
function hr {
    local start=$'\e(0' end=$'\e(B' line='qqqqqqqqqqqqqqqq'
    local cols=${COLUMNS:-$(tput cols)}
    while ((${#line} < cols)); do line+="$line"; done
    printf '%s%s%s\n' "$start" "${line:0:cols}" "$end"
}

# Git info
function gi {
    echo '➤ local branches'
    git branch
    echo ''
    echo '➤ remote branches'
    git branch -r
    echo ''
    echo '➤ remotes'
    git remote -v
    echo ''
}

function gll {
    ref=$(git symbolic-ref HEAD)
    branch=${ref#refs/heads/}

    git log origin/${branch}..${branch} $* -p
}

# Colored man pages
function man {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# venv python 3
function venv {
    if ! [[ -d ./venv-${PWD##*/} ]]; then
        virtualenv -p python3 ./venv-${PWD##*/}
    fi
    source ./venv-${PWD##*/}/bin/activate
}

# venv python 2
function venv2 {
    if ! [[ -d ./venv-${PWD##*/} ]]; then
        virtualenv -p python2 ./venv-${PWD##*/}
    fi
    source ./venv-${PWD##*/}/bin/activate
}

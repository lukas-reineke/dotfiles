# mkdir and enter
function mkcd {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo -e "\e[31m$* already exists\e[39m"
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
    elif [[ -f "$*" ]]; then
        echo -e "\e[31m$* is not a directory\e[39m" 1>&2
        local dir=$(dirname "$*")
        builtin cd "$dir"
    else
        builtin cd "$*"
    fi
}
alias cd='exec_scmb_expand_args cs'

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
        str=${str::-1}
    fi
    mv $str{,-old}
}

# copy to -bu
function bu {
    str="$1"
    if [ "${str: -1}" == "/" ]; then
        str=${str::-1}
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
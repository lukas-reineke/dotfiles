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
            echo -e ${RED}'➤ '${NC}'Added '${PWD##*/}' environment variables\n'
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

# fbr - checkout git branch (including remote branches), sorted by most recent commit
function b() {
    local branches branch
    branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
        branch=$(echo "$branches" |
        fzf --height 20% --reverse +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
bind '"\C-b":" b\n"'

function f {
    DIR=$(~/dotfiles/lib/bfs/bfs -type d| fzf --height 20% --reverse +m)
    if [[ ! -z $DIR ]]; then
        cs $DIR
    fi
}
bind '"\C-f":" f\n"'

function db() {
    local branches branch
    branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
    branch=$(echo "$branches" | fzf --height 20% --reverse +m) &&
    git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##") &&
    git remote prune origin
}

# fcoc - checkout git commit
fcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
        commit=$(echo "$commits" | fzf --tac +s +m -e) &&
        git checkout $(echo "$commit" | sed "s/ .*//")
}

# fh - repeat history
function fzf_history() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --height 20% --reverse +s --tac | sed 's/ *[0-9]* *//')
}
bind '"\C-r":" fzf_history\n"'

# fkill - kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# tmux
tm() {
    local session
    newsession=${1:-dev}
    session=$(tmux list-sessions -F "#{session_name}" | \
        fzf --query="$1" --select-1 --exit-0) &&
        tmux attach-session -t "$session" || tmux new-session -s $newsession
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

function markd {
    mark ${PWD##*/}
}

function clp {
    cat $@ | pbcopy
}

function vman {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}


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
        if [ -f ./.nvmrc ]; then
            nvm use &> /dev/null
            echo -e ${GRN}'➤ '${NC}'Use local Node version '$(node --version)'\n'
        fi
    elif [[ -f "$*" ]]; then
        echo -e ${RED}"$* is not a directory"${NC} 1>&2
        local dir=$(dirname "$*")
        builtin cd "$dir"
    else
        builtin cd "$*"
    fi
    cd-history-save
}
alias cd='exec_scmb_expand_args cs'

# function mvv {
#     if git ls-files --error-unmatch $1 > /dev/null 2>&1; then
#         git mv $*
#     else
#         /bin/mv $*
#     fi
# }
# alias mv='mvv'

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
bind '"\C-e":"ce\n"'

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
        if [[ ${@:2} ]]; then
            command yarn add "${@:2}"
        else
            command yarn install
        fi
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
        str=${str%?}
    fi
    mv $str{,-old}
}

# copy to -bu
function bu {
    str="$1"
    if [ "${str: -1}" == "/" ]; then
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

is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

# Git info
function gi {
    is_in_git_repo || return
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

function gt {
    is_in_git_repo || return

    git tag --sort -version:refname |
    fzf --reverse --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

function gll {
    is_in_git_repo || return
    ref=$(git symbolic-ref HEAD)
    branch=${ref#refs/heads/}

    git log origin/${branch}..${branch} $* -p
}

GIT_REF_FORMAT="%(refname:short)@[0;90m[[0;31m%(committername)[0;90m]@[0;37m%(contents:subject)[0m"

# fbr - checkout git branch (including remote branches), sorted by most recent commit
function ba() {
    is_in_git_repo || return
    local BRANCHES BRANCH

    BRANCHES=$(git for-each-ref --sort=-committerdate refs/heads/ refs/remotes --format="$GIT_REF_FORMAT" | perl -pe 's|^[^@]*?/||' | awk '! a[$0]++')

    BRANCH=$(echo "$BRANCHES" | column -t -s '@' | fzf --no-hscroll --height 40% --reverse --ansi | awk '{print $1}')

    if [[ -n $BRANCH ]]; then
        git checkout $(echo "$BRANCH" | sed "s/.* //")
    fi
}

function prs() {
    is_in_git_repo || return
    local PRS BRANCH

    PRS=$(\
        hub pr list |\
        sed "s/^\s*#//" |\
        sed "s/DO.NOT.MERGE\s*/$(printf ${RED}"DNM"${NC}) /" |\
        sed "s/Needs.Fixes\s*/$(printf ${RED}"NF"${NC}) /" |\
        sed "s/Has.Migration\s*/$(printf ${BLU}"M"${NC}) /" |\
        sed "s/Has.Partial.Test.Coverage\s*/$(printf ${YEL}"PTC"${NC}) /" |\
        sed "s/Tests.Skipped\s*/$(printf ${YEL}"TS"${NC}) /" |\
        sed "s/Has.Test.Coverage\s*/$(printf ${GRN}"TC"${NC}) /" |\
        sed "s/Tests.Not.Required\s*/$(printf ${CYN}"TNR"${NC}) /" |\
        sed "s/Awaiting.\{4\}\s*/$(printf ${GRN}"馬"${NC})/" |\
        sed "s/\s\s\s/@/g" |\
        column -t -s @\
    )

    PR=$(echo "$PRS" | fzf --no-hscroll --height 40% --reverse --ansi | awk '{print $1}')

    if [[ -n $PR ]]; then
        hub pr checkout $PR
    fi
}

function ta() {
    is_in_git_repo || return
    local TAGS TAG
    TAGS=$(git tag --sort=-version:refname)

    TAG=$(echo "$TAGS" | fzf --height 20% --reverse --ansi --preview-window right:70% --preview 'git show --color=always {} | head -'$LINES)

    if [[ -n $TAG ]]; then
        git checkout "$TAG"
    fi
}

function b() {
    is_in_git_repo || return
    local BRANCHES BRANCH

    BRANCHES=$(git for-each-ref --sort=-committerdate refs/heads/ --format="$GIT_REF_FORMAT" | perl -pe 's|^[^@]*?/||' | awk '! a[$0]++')

    BRANCH=$(echo "$BRANCHES" | column -t -s '@' | fzf --no-hscroll --height 20% --reverse --ansi | awk '{print $1}' )

    if [[ -n $BRANCH ]]; then
        git checkout $(echo "$BRANCH" | sed "s/.* //")
    fi
}
bind '"\C-b":" b\n"'

function fa() {
    local FILES
    FILES=$(git ls-files --modified | fzf --height 20% --reverse -m --ansi)
    if [[ -n $FILES ]]; then
        for FILE in $FILES; do
            git add --verbose "$FILE"
        done
    fi
}

function f {
    local DIR
    DIR=$(~/dotfiles/lib/bfs/bfs -type d| fzf --height 20% --reverse +m)
    if [[ -n $DIR ]]; then
        cs "$DIR"
    fi
}
bind '"\C-f":" f\n"'

function urls {
    local URL
    URL=$(tmux capture-pane -pJ | xurls | fzf --height 20% --reverse)
    if [[ -n $URL ]]; then
        opera-beta "$URL" &> /dev/null
    fi
}
bind '"\C-o":" urls\n"'

function pr {
    local URL
    URL=$(tmux capture-pane -pJ | xurls | grep --color=never 'pull/new')
    if [[ -n $URL ]]; then
        opera-beta "$URL" &> /dev/null
    fi
}
bind '"\C-a":" pr\n"'

function vf {
    FILE=$(~/dotfiles/lib/bfs/bfs -type f | fzf --height 20% --reverse +m)
    if [[ -n $FILE ]]; then
        nvim "$FILE"
    fi
}

function db() {
    local ALL_BRANCHES BRANCHES BRANCH
    ALL_BRANCHES=$(git for-each-ref --sort=-committerdate refs/heads/ --format="$GIT_REF_FORMAT")
    BRANCHES=$(echo "$ALL_BRANCHES" | column -t -s '@' | fzf --height 20% --reverse -m --ansi | awk '{print $1}' )

    if [[ -n $BRANCHES ]]; then
        for BRANCH in $BRANCHES; do
            git branch -D $(echo "$BRANCH" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
        done
    fi
}

function dbm() {
    local ALL_BRANCHES BRANCHES BRANCH
    ALL_BRANCHES=$(git branch --sort=-committerdate --format="$GIT_REF_FORMAT" --merged)
    BRANCHES=$(echo "$ALL_BRANCHES" | column -t -s '@' | fzf --height 20% --reverse -m --ansi | awk '{print $1}' )

    if [[ ! -z $BRANCHES ]]; then
        for BRANCH in $BRANCHES; do
            git branch -D $(echo "$BRANCH" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
        done
    fi
}

function gpsu() {
    local branch=$(git branch --no-color | grep \* | cut -d ' ' -f2)
    git push --set-upstream origin $branch
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
    local command=$(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | fzf --height 20% --reverse +s --tac)
    history -s "$command"
    $command
}
bind '"\C-r":" fzf_history\n"'

function kc() {
    local CONTEXT
    CONTEXT=$(
        kubectl config view -o jsonpath='{.contexts[*].name}' |
        sed -e 's/ /\n/g' |
        fzf --height 20% --reverse
    )
    if [[ -n $CONTEXT ]]; then
        kubectl config use-context "$CONTEXT"
    fi
}

function klogs() {
    local PODS
    PODS=$(
        kubectl get pods |
        tail -n +2 |
        fzf --reverse -m |
        cut -f 1 -d ' '
    )
    if [[ -n $PODS ]]; then
        for pod in $PODS; do
            echo -e "\n\n"${MGT}""${BOLD}"$pod"${NC}"\n"
            if [[ -n $1 ]]; then
                kubectl logs "$pod" | tail -n"$1"
            else
                kubectl logs "$pod"
            fi
        done
    fi
}

# fkill - kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# tmux new session
tm() {
    local session, newsession
    newsession=${1:-dev}
    session=$(tmux list-sessions -F "#{session_name}" | fzf --query="$1" --select-1 --exit-0)
    if [[ -n "$session" ]]; then
        tmux attach-session -t "$session"
    elif [[ -n "$newsession" ]]; then
        tmux attach-session -t "$newsession"
    fi
}

# tmux kill session
td() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | fzf --query="$1" --select-1 --exit-0 --reverse --height 20%)
    [ -n "$session" ] && tmux kill-session -t "$session"
}

r() {
    local script
    script=$(python3 ~/dotfiles/scripts/npm-scripts.py | fzf --height 20% --reverse +m)
    [ -n "$script" ] && npm run "$script"
}

m() {
    local script
    script=$(python3 ~/dotfiles/scripts/django-scripts.py | fzf --height 20% --reverse +m)
    [ -n "$script" ] && eval python manage.py "$script"
}

nb() {
    local branch
    branch=$(python3 ~/dotfiles/scripts/trello-tickets.py | fzf --height 20% --reverse)
    [ -z "$branch" ] && return

    ID="$(cut -d' ' -f1 <<<"$branch")"
    DESC="$(cut -d' ' -f2 <<<"$branch")"

    echo "$DESC"
    echo -n "Keep Description? [y/n]: "

    read KEEP

    if [[ $KEEP =~ ^(n|N)$ ]]; then
        echo ""
        echo -n "Description: "
        read DESC
        DESC="$DESC"
    fi

    if [[ -n $DESC ]] && [[ -n $ID ]]; then
        git checkout -b $ID-$DESC
    fi
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

function venv36 {
    if ! [[ -d ./venv-${PWD##*/} ]]; then
        virtualenv -p python3.6 ./venv-${PWD##*/}
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

function rep {
    rg $1 --no-heading --color=never --files-with-matches | xargs perl -pi -E 's/'$1'/'$2'/g'
}

function ccrypt {
    if [[ $1 ]]; then
        cat $1 | gpg --trust-model always -ear adgo | xsel -b
    else
        nvim /tmp/temp-text-file.txt \
        && cat /tmp/temp-text-file.txt \
        | gpg --trust-model always -ear adgo \
        | xsel -b \
        && rm /tmp/temp-text-file.txt
    fi
}

function exc {
    if [ -f "$1" ]; then
        case $1 in
            *.tar.xz)   tar -xvf "$1"                         ;;
            *.tar.bz2)  tar -jxvf "$1"                        ;;
            *.tar.gz)   tar -zxvf "$1"                        ;;
            *.bz2)      bunzip2 "$1"                          ;;
            *.dmg)      hdiutil mount "$1"                    ;;
            *.gz)       gunzip "$1"                           ;;
            *.tar)      tar -xvf "$1"                         ;;
            *.tbz2)     tar -jxvf "$1"                        ;;
            *.tgz)      tar -zxvf "$1"                        ;;
            *.zip)      unzip "$1"                            ;;
            *.pax)      pax -r < "$1"                         ;;
            *.pax.z)    uncompress "$1" --stdout | pax -r     ;;
            *.rar)      7z x "$1"                             ;;
            *.z)        uncompress "$1"                       ;;
            *.7z)       7z x "$1"                             ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    fi
}


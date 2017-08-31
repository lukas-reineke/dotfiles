if [[ -z $CD_HISTORY_FILE ]] ; then
    export CD_HISTORY_FILE="$HOME/.cd-history"
fi

if [[ ! -f $CD_HISTORY_FILE ]]; then
    touch $CD_HISTORY_FILE
fi

function cd-history-save() {
    local PWD="$(pwd)"
    perl -p -i -e "s#${PWD}\n##g" $CD_HISTORY_FILE
    echo "$(pwd)" >> $CD_HISTORY_FILE
}

fzfcmd() {
   echo "fzf --height 20% --reverse"
}

function cdh() {
    local jumpline=$(cat ${CD_HISTORY_FILE} | $(fzfcmd) --bind=ctrl-y:accept --tac)
    if [[ -n ${jumpline} ]]; then
        local jumpdir=$(echo "${jumpline}" | sed "s#~#$HOME#")
        perl -p -i -e "s#${jumpline}\n##g" $CD_HISTORY_FILE
        cd "${jumpdir}" && echo "${jumpline}" >> $CD_HISTORY_FILE
    fi
}


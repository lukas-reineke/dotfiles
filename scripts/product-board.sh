#!/bin/bash

function productboard_features() {
    NEXT="https://api.productboard.com/features"

    while [ "$NEXT" != "" ]
    do
        CURL=$(curl --location --silent --request GET --header "Authorization: Bearer ${PRODUCTBOARD_TOKEN}" --header "x-version: 1" $NEXT)
    
        JQ=$(jq -r '.data[]|"\(.name)\t\(.id)" | gsub("\n"; " ")' <<< "$CURL")

        if [[ ! "$?" -eq 0 ]]; then
            echo "parsing the result has failed"
            exit 1
        fi

        echo -e "$JQ" | column -t -s $'\t'
        NEXT=$(jq -r '.links.next' <<< "$CURL")
    done
}

FEATURES=$(productboard_features| fzf --height 20% --reverse --multi)

if [[ -n $FEATURES ]]; then
    for id in $(echo -e "$FEATURES" | awk '{print $NF}'); do
        echo resolve "$id"
    done
fi

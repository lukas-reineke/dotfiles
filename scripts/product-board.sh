#!/bin/bash

function productboard_features() {
    for STATUS in "Planned" "In%20Progress"; do
        NEXT="https://api.productboard.com/features?status.name=$STATUS"

        while [[ "$NEXT" != "" ]]; do
            CURL=$(curl --silent --header "Authorization: Bearer ${PRODUCTBOARD_TOKEN}" --header "x-version: 1" "$NEXT")

            JQ=$(jq -r '.data[]|"\(.name)\t\(.id)" | gsub("\n"; " ")' <<<"$CURL")

            echo -e "$JQ" | column -t -s $'\t'
            NEXT=$(jq -r '.links.next' <<<"$CURL")
        done
    done
}

FEATURES=$(productboard_features | fzf --height 20% --reverse --multi)

if [[ -n $FEATURES ]]; then
    for ID in $(echo -e "$FEATURES" | awk '{print $NF}'); do
        echo resolve "$ID"
    done
fi

#!/bin/bash
set -e

TOKEN_FILE="$HOME/.config/raindrop-token"
CACHE_FILE="/tmp/raindrop-cache"
WORK_COLLECTIONS="Mapbox|Engineering Management"
RELOAD_ENTRY="↺  Reload bookmarks"

if [ ! -f "$TOKEN_FILE" ]; then
    notify-send -a Raindrop "Token file not found: $TOKEN_FILE"
    exit 1
fi

TOKEN=$(cat "$TOKEN_FILE")

if [ ! -f "$CACHE_FILE" ]; then
    COLLECTIONS=$(curl -s "https://api.raindrop.io/rest/v1/collections" -H "Authorization: Bearer $TOKEN")
    COLLECTIONS_CHILD=$(curl -s "https://api.raindrop.io/rest/v1/collections/childrens" -H "Authorization: Bearer $TOKEN")
    COLLECTION_MAP=$(echo "$COLLECTIONS $COLLECTIONS_CHILD" | jq -rs '
        [.[].items[] | {(._id | tostring): {title: .title, parent: (.parent["$id"] | tostring)}}] | add
    ')

    PAGE=0
    > "$CACHE_FILE"
    while true; do
        RESPONSE=$(curl -s "https://api.raindrop.io/rest/v1/raindrops/0?perpage=50&page=$PAGE" \
            -H "Authorization: Bearer $TOKEN")

        echo "$RESPONSE" | jq -r --argjson cols "$COLLECTION_MAP" '
            def col_path(id):
                $cols[id] as $col |
                if $col == null then "Unsorted"
                elif ($col.parent == "null") then $col.title
                else col_path($col.parent) + "/" + $col.title
                end;

            .items[] | "\(.title) [\(col_path(.collectionId | tostring))] [\(.domain)]\t\(.link)"
        ' >> "$CACHE_FILE"

        TOTAL=$(echo "$RESPONSE" | jq -r '.count')
        FETCHED=$(( (PAGE + 1) * 50 ))
        [ "$FETCHED" -ge "$TOTAL" ] && break
        PAGE=$(( PAGE + 1 ))
    done
fi

MODE="${1:-work}"

case "$MODE" in
    work)
        ITEMS=$(grep -E "\[($WORK_COLLECTIONS)" "$CACHE_FILE")
        PROMPT="Bookmark [Work]"
        NEXT_MODE="personal"
        ;;
    personal)
        ITEMS=$(grep -vE "\[($WORK_COLLECTIONS)" "$CACHE_FILE")
        PROMPT="Bookmark [Personal]"
        NEXT_MODE="work"
        ;;
esac

set +e
SELECTION=$(printf "%s\n%s" "$(echo "$ITEMS" | cut -f1)" "$RELOAD_ENTRY" | rofi -dmenu -i -p "$PROMPT" \
    -kb-custom-1 "Tab" \
    -kb-element-next "" \
    -mesg "Tab: switch mode")
EXIT_CODE=$?
set -e

case $EXIT_CODE in
    1)  exit 0 ;;
    10) exec "$0" "$NEXT_MODE" ;;
    0)
        [ -z "$SELECTION" ] && exit 0
        if [ "$SELECTION" = "$RELOAD_ENTRY" ]; then
            rm -f "$CACHE_FILE"
            exec "$0" "$MODE"
        fi
        URL=$(grep -F "$SELECTION" "$CACHE_FILE" | head -1 | cut -f2)
        xdg-open "$URL"
        ;;
esac

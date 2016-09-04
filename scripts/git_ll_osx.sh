#!/bin/bash

FINAL=$(ls -1AlhF | while read line; do
    i=$(echo $line | awk '{print $9}')
    if [ -d "$i"/.git ]; then

        if [ $@ ]; then
            if [ $@ == "-f" ] || [ $@ == "--fetch" ]; then
                git --git-dir="$i"/.git --work-tree="$i" fetch
            fi
            if [ $@ == "-p" ] || [ $@ == "--pull" ]; then
                git --git-dir="$i"/.git --work-tree="$i" pull
            fi
        fi
        LIST=$(git --git-dir="$i"/.git --work-tree="$i" status --porcelain -b)

        COUNTER=0
        for l in $(echo $LIST | tr "..." "\n")
        do
            let "COUNTER++"
            if [ $COUNTER == 2 ]; then
                BRANCH=$l
            fi

            if [ $l == '[ahead' ]; then
                AHEADCOUNTER=$(($COUNTER + 1))
            fi

            if [ $l == '[behind' ] || [ $l == 'behind' ]; then
                BEHINDCOUNTER=$(($COUNTER + 1))
            fi

            if [ "$COUNTER" == "$BEHINDCOUNTER" ]; then
                BEHIND="↓·$l"
            fi

            if [ "$COUNTER" == "$AHEADCOUNTER" ]; then
                AHEAD="↑·$l"
            fi

            if [ $l == 'D' ]; then
                let "DELETED++ || 1"
            fi

            if [ $l == 'M' ]; then
                let "MODIFIED++ || 1"
            fi

            if [ $l == 'A' ]; then
                let "ADDED++ || 1"
            fi

            if [ $l == 'R' ]; then
                let "RENAMED++ || 1"
            fi

            if [ $l == '??' ]; then
                let "UNTRACKED++ || 1"
            fi

            if [ $l == 'UU' ]; then
                let "CONFLICT++ || 1"
            fi

        done

        OUTPUT="\x1B[35m$BRANCH\x1B[39m|"

        if [ "$BEHIND" ]; then
            OUTPUT="$OUTPUT${BEHIND%?}"
        fi

        if [ "$AHEAD" ]; then
            OUTPUT="$OUTPUT${AHEAD%?}"
        fi

        if [ "$CONFLICT" ]; then
            OUTPUT="$OUTPUT\x1B[31m❌ $CONFLICT\x1B[39m"
        fi

        if [ "$DELETED" ]; then
            OUTPUT="$OUTPUT\x1B[31m❌ $DELETED\x1B[39m"
        fi

        if [ "$MODIFIED" ]; then
            OUTPUT="$OUTPUT\x1B[34m✚ $MODIFIED\x1B[39m"
        fi

        if [ "$ADDED" ]; then
            OUTPUT="$OUTPUT\x1B[33m●$ADDED\x1B[39m"
        fi

        if [ "$RENAMED" ]; then
            OUTPUT="$OUTPUT\x1B[32m⇄ $RENAMED\x1B[39m"
        fi

        if [ "$UNTRACKED" ]; then
            OUTPUT="$OUTPUT\x1B[36m…$UNTRACKED\x1B[39m"
        fi

        if [ ! "$BEHIND" ] && [ ! "$AHEAD" ] && [ ! "$DELETED" ] && [ ! "$MODIFIED" ] && [ ! "$ADDED" ] && [ ! "$RENAMED" ] && [ ! "$UNTRACKED" ] && [ ! "$CONFLICT" ]; then
            OUTPUT="$OUTPUT\x1B[92m✔\x1B[39m"
        fi

        echo -e "\x1B[33m$(echo $line | awk '{print $1,$3,$9}')\x1B[39m§[$OUTPUT]"

        COUNTER=0
        BRANCH=''
        AHEADCOUNTER=''
        BEHINDCOUNTER=''
        AHEAD=''
        BEHIND=''
        DELETED=''
        MODIFIED=''
        ADDED=''
        RENAMED=''
        UNTRACKED=''
        CONFLICT=''
        OUTPUT=''

    else
        echo -e $(echo $line | awk '{print $1,$3,$9}');
    fi;
done)

# printf "%s \n" "$FINAL"
printf "%s \n" "$FINAL" | column -t -s "§" | sed -n '1!p'

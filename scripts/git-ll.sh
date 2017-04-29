#!/bin/bash

FINAL=$(ls -1AlhF | while read line; do
    i=$(echo $line | awk '{print $9}')
    if [ -d "$i"/.git ]; then

        if [ $@ ]; then
            if [ $@ == "-f" ] || [ $@ == "--fetch" ]; then
                git --git-dir="$i"/.git --work-tree="$i" fetch
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

        OUTPUT="\e[36m$BRANCH\e[39m"

        if [ "$BEHIND" ]; then
            OUTPUT="$OUTPUT ${BEHIND::-1}"
        fi

        if [ "$AHEAD" ]; then
            OUTPUT="$OUTPUT ${AHEAD::-1}"
        fi

        if [ "$DELETED" ]; then
            OUTPUT="$OUTPUT \e[31m❌ $DELETED\e[39m"
        fi

        if [ "$MODIFIED" ]; then
            OUTPUT="$OUTPUT \e[34m✚ $MODIFIED\e[39m"
        fi

        if [ "$ADDED" ]; then
            OUTPUT="$OUTPUT \e[33m● $ADDED\e[39m"
        fi

        if [ "$RENAMED" ]; then
            OUTPUT="$OUTPUT \e[32m⇄ $RENAMED\e[39m"
        fi

        if [ "$UNTRACKED" ]; then
            OUTPUT="$OUTPUT \e[31m… $UNTRACKED\e[39m"
        fi

        if [ "$CONFLICT" ]; then
            OUTPUT="$OUTPUT \e[36m❌ $CONFLICT\e[39m"
        fi

        echo -e "\e[1m\e[32m$(echo $line | awk '{print $1,$3,$9}')\e[39m\e[0m§❲$OUTPUT❳"

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

printf "%s \n" "$FINAL" | column -t -s "§" -o " " | sed -n '1!p'

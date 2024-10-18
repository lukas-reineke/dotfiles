#!/bin/bash
set -e

PROJECTS="Home\nHome /routines\nHome /shopping\nHome /vehicle\nHome /contact\nOS\nOS /ibl\nOS /headlines\nOS /reddit\nOS /virt-column\nOS /lsp-format\nOS /cbfmt\nWork\nWork /ev-data-stream\nStudy\nStudy /japanese\nStudy /software\nStudy /personal-development"
TODO=$(rofi -dmenu -l 0 -yoffset -300 -p "")

if [[ -n $TODO ]]; then
    if [[ $TODO == *# ]]; then
        PROJECT=$(echo -e "$PROJECTS" | rofi -dmenu -i -yoffset -300 -p "")
        TODO="${TODO}${PROJECT}"
    fi


    tod t q -c "$TODO"
    notify-send -a Todoist "Saved Todo: $TODO"
fi

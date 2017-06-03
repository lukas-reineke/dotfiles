#!/bin/bash

## Key bindings
if [ $(uname) == 'Darwin' ]; then
    bind '"\033[A": history-search-backward'
    bind '"\033[B": history-search-forward'
    bind '"\033OA": history-search-backward'
    bind '"\033OB": history-search-forward'
    bind '"\033[1;2D": backward-word'
    bind '"\033[1;2C": forward-word'
else
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
    bind '"\eOA": history-search-backward'
    bind '"\eOB": history-search-forward'
    bind '"\e[1;2D": backward-word'
    bind '"\e[1;2C": forward-word'
fi

bind "set completion-map-case on"


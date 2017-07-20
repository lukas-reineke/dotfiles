#!/bin/bash

if [ $(uname) == 'Darwin' ]; then
    bind '"\033[A": history-search-backward'
    bind '"\033[B": history-search-forward'
    bind '"\033OA": history-search-backward'
    bind '"\033OB": history-search-forward'
else
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
    bind '"\eOA": history-search-backward'
    bind '"\eOB": history-search-forward'
fi


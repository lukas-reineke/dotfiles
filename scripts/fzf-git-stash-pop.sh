#!/bin/bash

git stash list |
fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --header $(basename `git rev-parse --show-toplevel`) \
    --bind "ctrl-n:preview-down,ctrl-p:preview-up" \
    --preview "echo {1} | sed 's/://' | xargs -I % git show --color=always %" |
awk '{ print $1 }' |
sed 's/://' |
xargs -I % git stash pop %


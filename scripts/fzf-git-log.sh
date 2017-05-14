#!/bin/bash

git log --graph --color=always --abbrev-commit \
    --format='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' |
fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
        {}
        FZF-EOF" \
    --preview "
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
        {}
        FZF-EOF"


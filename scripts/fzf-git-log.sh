#!/bin/bash

git log --graph --color=always --abbrev-commit \
    --format='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' |
fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --header $(basename `git rev-parse --show-toplevel`) \
    --bind "ctrl-n:preview-down,ctrl-p:preview-up" \
    --bind "ctrl-m:execute:
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % bash -c 'git show --color=always % | diff-so-fancy | less -R') << 'FZF-EOF'
        {}
        FZF-EOF" \
    --expect=ctrl-o \
    --preview "
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % bash -c 'git show --color=always % | diff-so-fancy') << 'FZF-EOF'
        {}
        FZF-EOF"


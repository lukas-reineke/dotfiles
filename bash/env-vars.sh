#!/bin/bash

export FZF_COMPLETION_TRIGGER='++'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*"'
export GIT_REPO_DIR="$HOME/dev"
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH=${PATH}:$HOME/.npm-global
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

bind "set completion-map-case on"
set -o vi
set editing-mode vi
set show-mode-in-prompt on
set vi-ins-mode-string "+"
set vi-cmd-mode-string ":"


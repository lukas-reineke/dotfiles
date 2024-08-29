#!/bin/bash

export RED='\e[0;31m'
export GRN='\e[0;32m'
export YEL='\e[33m'
export CYN='\e[36m'
export BLU='\e[34m'
export LGR='\e[37m'
export DGR='\e[90m'
export WHT='\e[97m'
export MGT='\e[35m'
export UNDERLINE='\e[4m'
export BOLD='\e[1m'
export NC='\e[0m' # No Color

# export FZF_COMPLETION_TRIGGER='++'
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*" --ignore-file ~/dotfiles/fzf-ignore'
export FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up,ctrl-h:select-all,ctrl-l:deselect-all\" --color=dark --color=fg:-1,bg:-1,hl:#98c379,fg+:#ffffff,bg+:#1a1a1a,hl+:#98c379 --color=info:#c678dd,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
export GIT_REPO_DIR="$HOME/dev"
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH=${PATH}:$HOME/dotfiles/lib/vimv
export PATH=${PATH}:$HOME/dev/golib/bin
export PATH=${PATH}:$HOME/dev/go/bin
export PATH=${PATH}:$HOME/.cargo/bin
export PATH=${PATH}:$HOME/.local/bin
export PATH=${PATH}:$HOME/.gem/ruby/2.7.0/bin
# export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json

# export NVM_DIR="$HOME/.nvm"
export BAT_THEME="ansi"

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s\033\\" "${PWD##*/}"'
# export GIT_PROMPT_THEME=Custom
# export GIT_PROMPT_ONLY_IN_REPO=0

export GOPATH="$HOME/dev/golib:$HOME/dev/go"

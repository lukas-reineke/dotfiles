#!/bin/bash

export FZF_COMPLETION_TRIGGER='++'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*" --ignore-file ~/dotfiles/fzf-ignore'
export FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\" --color=dark --color=fg:-1,bg:-1,hl:#98c379,fg+:#ffffff,bg+:#1a1a1a,hl+:#98c379 --color=info:#c678dd,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
export GIT_REPO_DIR="$HOME/dev"
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH=${PATH}:$HOME/.npm-global
export PATH=${PATH}:$HOME/dotfiles/lib/vimv
export PATH=${PATH}:$HOME/.local/bin
export PATH=${PATH}:$HOME/go/bin
export PATH=${PATH}:$HOME/.gem/ruby/2.6.0/bin
export PATH=${PATH}:$HOME/.gem/ruby/2.7.0/bin
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
export TERMINFO="$HOME/.terminfo"

export NVM_DIR="$HOME/.nvm"
export BAT_THEME="ansi-dark"

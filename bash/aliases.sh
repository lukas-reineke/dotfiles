# list
alias la='~/dotfiles/scripts/git-ll-mac.sh'
alias cll='clear && ~/dotfiles/scripts/git-ll-mac.sh'
alias ls='ls -lsHFG'
alias lg='ls -AlsHFG | grep'
alias ll='ls -AlsHFG'
alias lll='ls -AlsHFG | less -R'

# move
alias cl='clear'
alias lc='clear'
alias mkdir='mkdir -p'
alias cls='clear && gs'
alias gg='cd $(git rev-parse --show-toplevel)'

# vim
alias sv='sudoedit'
alias v='ge nvim'
alias vim='ge nvim'
alias gv='ge nvim -c "Gdiff"'

# system
alias rm="ge command rm -rf"
alias grep='grep --color=always'
alias reload='source ~/dotfiles/bash/bashrc'
alias sudo='sudo env PATH=$PATH'
alias cat='ge ccat'
alias crypt='gpg --trust-model always -ear adgo'
alias ucrypt='xsel -b | gpg'
alias secrets='gpg -er lukas.reineke@protonmail.com .secrets'

# git
alias gl='~/dotfiles/scripts/fzf-git-log.sh'
alias log='git log --graph --all --oneline --decorate'
alias logs='git log --graph --all --decorate --relative-date'
alias gsmu='git submodule update --remote --merge'
alias gu='git reset HEAD~ --soft'
alias gmt='git mergetool'
alias grpo='git remote prune origin'
alias gds='git diff --staged'
alias gwap='git diff -w --no-color | git apply --cached --ignore-whitespace && git checkout -- . && git reset && git add -p'
alias gca='git commit --amend --no-edit'
alias gcae='git commit --amend'
alias gpsn='git push --no-verify'
alias gpsfn='git push --force --no-verify'

# python
alias da='deactivate'
alias iyoga='ipython --profile=yoga'

# stuff
alias lock='~/scripts/i3lock-fancy/lock'
alias installvm='sudo vmware-modconfig --console --install-all'
alias cal='gcalcli calm'
alias fakesmtp='sudo java -jar ~/dotfiles/fakeSMTP-1.13.jar'


# docker

alias dmongo='docker run --rm --name mogno-docker -v mongodbdata:/data/db -p 27017:27017 mongo:3.2-jessie'
alias dpostgres='docker run --rm --name pg-docker -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -e POSTGRES_DB=$POSTGRES_DB -p 5432:5432 -v postgresdbdata:/var/lib/postgresql/data postgres:9.5.16-alpine'


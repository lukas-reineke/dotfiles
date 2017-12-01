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
alias memo='nvim ~/dev/memo.md'
alias gv='ge nvim -c "Gdiff"'
alias r='roamer --skip-approval'

# tmux
alias t='tmux new -s'

# vpn
alias vpn='cd /etc/openvpn/de && sudo openvpn --config de.ovpn'
alias vpnus='cd /etc/openvpn/us && sudo openvpn --config us.ovpn'
alias vpno='cd /etc/openvpn/ocean && sudo openvpn --config ocean.ovpn'

# system
alias qq='sudo shutdown -h 0'
alias disk='df -Tha --total | grep /dev/sd'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias rm="ge command rm -rf"
alias p='popd'
alias grep='grep --color=always'
alias reload='source ~/dotfiles/bash/bashrc'
alias sudo='sudo env PATH=$PATH'
alias cat='ge ccat'

# network
alias arp='sudo arp-scan --interface=wlp2s0b1 --localnet'
alias arpe='sudo arp-scan --interface=enp0s26f7u1u3 --localnet'
alias arpt='sudo arp-scan --interface=tun0 --localnet'
alias nl='nload wlp2s0b1'
alias ethup='sudo ip link set enp0s26f7u1u3 up'

# git
alias gl='~/dotfiles/scripts/fzf-git-log.sh'
alias log='git log --graph --all --oneline --decorate'
alias logs='git log --graph --all --decorate --relative-date'
alias gsmu='git submodule update --remote --merge'
alias gu='git reset HEAD~ --soft'
alias gmt='git mergetool'
alias jb='~/dotfiles/scripts/jira-branch.sh feature'
alias grpo='git remote prune origin'
alias gds='git diff --staged'
alias ss='~/dotfiles/scripts/fzf-git-stash.sh'


# pacman
alias pac='sudo pacman -Ss'
alias apac='sudo apacman'
alias pacy='sudo pacman -Syu'
alias apacy='sudo apacman -Syu'

# ssh
alias dsa='SSH_AUTH_SOCK=0'

# sublime
alias subl='sublime .'

# webpkack
alias wp='webpack --config webpack.config.js --progress --watch'
alias wps='webpack-dev-server --content-base dist/'

# redis
alias redis='redis-server'

# python
alias http='simplehttpserver'
alias da='deactivate'

# ionic
alias ri='ionic run'
alias bi='ionic build'

# irc
alias wee='weechat'

# android
alias avd='/opt/android-sdk/tools/android avd'

# stuff
alias links='vim ~/Dropbox/links.txt'
alias ply='~/dotfiles/scripts/play.sh'
alias clock='tty-clock -b -c -C 6'
alias lock='~/scripts/i3lock-fancy/lock'
alias installvm='sudo vmware-modconfig --console --install-all'
alias music='ncmpcpp'
alias bla='cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"'
alias disco='while true; do printf "\e[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.\e[0m"; done'
alias pokemon='xrandr --output eDP1 --mode 800x600 && sudo vbam -f 0 --no-opengl -F ~/.vbam/pokemon_fire_red.gba'
alias wireshark='GTK_THEME=Flat-Plat wireshark-gtk & disown'


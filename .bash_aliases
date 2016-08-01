# list
alias la='~/dotfiles/scripts/git_ll_osx.sh'
alias cll='clear && ~/dotfiles/scripts/git_ll_osx.sh'
alias ls='ls -lsHFG'
alias lg='ls -AlsHFG | grep'
alias lll='ls -AlsHFG | less -R'

# move
alias cl='clear'
alias mkdir='mkdir -p'

# folders
alias dev='cd ~/dev'
alias dot='cd ~/dotfiles'
alias see='cd ~/dev/see'

# vpn
alias vpn='cd /etc/openvpn/de && sudo openvpn --config de.ovpn'
alias vpnus='cd /etc/openvpn/us && sudo openvpn --config us.ovpn'
alias vpno='cd /etc/openvpn/ocean && sudo openvpn --config ocean.ovpn'

# system
alias qq='sudo shutdown -h 0'
alias disk='df -Tha --total | grep /dev/sd'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias rm="rm -rf"
alias p='popd'

# network
alias arp='sudo arp-scan --interface=wlp2s0b1 --localnet'
alias arpe='sudo arp-scan --interface=enp0s26f7u1u3 --localnet'
alias arpt='sudo arp-scan --interface=tun0 --localnet'
alias nl='nload wlp2s0b1'
alias ethup='sudo ip link set enp0s26f7u1u3 up'

# git
alias log="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

# pacman
alias pac='sudo pacman -S'
alias pacs='sudo pacman -Ss'
alias pacy='sudo pacman -Syu'
alias psyn='sudo pacman -Syy'

# ssh
alias sshaptx='ssh lukas@192.168.178.57'

# sublime
alias subl='sublime .'

# webpkack
alias wp='webpack --config webpack.config.js --progress --watch'
alias wps='webpack-dev-server --content-base dist/'

# redis
alias redis='redis-server'

# python
alias http='simplehttpserver'

# ionic
alias r='ionic run'
alias b='ionic build'

# irc
alias wee='weechat'

# android
alias avd='/opt/android-sdk/tools/android avd'

# display
alias xtn='xrandr --output eDP1 --mode 1440x900'

# stuff
alias ply='~/dotfiles/scripts/play.sh'
alias pse='~/dotfiles/scripts/pause.sh'
alias clock='tty-clock -b -c -C 6'
alias lock='~/.scripts/i3lock-fancy/lock'
alias music='ncmpcpp'
alias bla='cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"'
alias disco='while true; do printf "\e[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.\e[0m"; done'
alias pokemon='xrandr --output eDP1 --mode 800x600 && sudo vbam -f 0 --no-opengl -F ~/.vbam/pokemon_fire_red.gba'

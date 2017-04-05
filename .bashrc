# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
        *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set color with Ecma-48 (ISO/IEC-6429)
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    force_color_promt=yes
    color_prompt=yes
else
    color_prompt=
fi


# enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


## external
# git completion
if [ -f ~/dotfiles/lib/git-completion.bash ]; then
    source ~/dotfiles/lib/git-completion.bash
fi
if [ -f ~/dotfiles/lib/git-flow-completion.bash ]; then
    source ~/dotfiles/lib/git-flow-completion.bash
fi

# Setup fzf
if [[ ! "$PATH" == *$HOME/dotfiles/lib/fzf/bin* ]]; then
    export PATH="$PATH:$HOME/dotfiles/lib/fzf/bin"
fi
# fzf Man path
if [[ ! "$MANPATH" == *$HOME/dotfiles/lib/fzf/man* && -d "$HOME/dotfiles/lib/fzf/man" ]]; then
    export MANPATH="$MANPATH:$HOME/dotfiles/lib/fzf/man"
fi
# fzf Auto-completion
[[ $- == *i* ]] && source "$HOME/dotfiles/lib/fzf/shell/completion.bash" 2> /dev/null
# fzf Key bindings
if [ -f ~/dotfiles/lib/fzf/shell/key-bindings.bash ]; then
    source ~/dotfiles/lib/fzf/shell/key-bindings.bash
fi

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $(
        COMP_WORDS="${COMP_WORDS[*]}" \
        COMP_CWORD=$COMP_CWORD \
        PIP_AUTO_COMPLETE=1 $1
    ) )
}
complete -o default -F _pip_completion pip

# scm breeze
if [ -f ~/dotfiles/lib/scm_breeze/scm_breeze.sh ]; then
    source ~/dotfiles/lib/scm_breeze/scm_breeze.sh
fi

# git prompt
if [ -f ~/dotfiles/lib/bash-git-prompt/gitprompt.sh ]; then
    source ~/dotfiles/lib/bash-git-prompt/gitprompt.sh
    GIT_PROMPT_ONLY_IN_REPO=0
fi

## os specific
if [ $(uname) == 'Darwin' ]; then
    source ~/dotfiles/.osx
else
    source ~/dotfiles/.arch_linux
fi


### alias ###
if [ -f ~/dotfiles/.bash_aliases ]; then
    source ~/dotfiles/.bash_aliases
fi

### enviorment variables ###
if [ -f ~/dotfiles/.bash_env_vars ]; then
    source ~/dotfiles/.bash_env_vars
fi

### functions ###
if [ -f ~/dotfiles/.bash_functions ]; then
    source ~/dotfiles/.bash_functions
fi

### keyboard shortcuts ###
if [ -f ~/dotfiles/.bash_input ]; then
    source ~/dotfiles/.bash_input
fi

### secrets ###
if [ -f ~/dotfiles/.secrets ]; then
    source ~/dotfiles/.secrets
fi

### pm2 completion ###
if [ -f ~/dotfiles/lib/pm2-completion.bash ]; then
    source ~/dotfiles/lib/pm2-completion.bash
fi

### minikube completion ###
if [ -f ~/dotfiles/lib/minikube-completion.bash ]; then
    source ~/dotfiles/lib/minikube-completion.bash
fi

eval "$(fasd --init auto)"

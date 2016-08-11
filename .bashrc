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
source ~/dotfiles/lib/git-completion.bash
source ~/dotfiles/lib/git-flow-completion.bash

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
source ~/dotfiles/lib/scm_breeze/scm_breeze.sh



## os specific
# arch
#source ~/dotfiles/.arch_linux

#osx
source ~/dotfiles/.osx


### alias ###
if [ -f ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi

### enviorment variables ###
if [ -f ~/dotfiles/.bash_env_vars ]; then
    . ~/dotfiles/.bash_env_vars
fi

### functions ###
if [ -f ~/dotfiles/.bash_functions ]; then
    . ~/dotfiles/.bash_functions
fi

### keyboard shortcuts ###
if [ -f ~/dotfiles/.bash_input ]; then
    . ~/dotfiles/.bash_input
fi

### keyboard shortcuts ###
if [ -f ~/dotfiles/.secrets ]; then
    . ~/dotfiles/.secrets
fi

### pm2 completion ###
if [ -f ~/dotfiles/lib/pm2-completion.bash ]; then
    . ~/dotfiles/lib/pm2-completion.bash
fi

# learn vim!!
export VISUAL=vim
export EDITOR="$VISUAL"

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
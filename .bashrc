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
shopt -s globstar

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set color with Ecma-48 (ISO/IEC-6429)
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    force_color_promt=yes
    color_prompt=yes
else
    color_prompt=
fi


### alias ###
if [ -f ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi


### functions ###
if [ -f ~/dotfiles/.bash_functions ]; then
    . ~/dotfiles/.bash_functions
fi

### enviorment variables ###
if [ -f ~/dotfiles/.bash_env_vars ]; then
    . ~/dotfiles/.bash_env_vars
fi


# enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


# arch stuff
screenfetch -t
# export PS1="\[$(tput setaf 6)\]╔═╡\e[46m \[$(tput setaf 16)\]サイコパス \e[0m\[$(tput setaf 6)\]│ \[$(tput setaf 0)\]\W\n\[$(tput setaf 6)\]╚═════╾ \[$(tput sgr0)\]"


## external
# git prompt
source ~/.scripts/.bash-git-prompt/gitprompt.sh
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_THEME=Solarized

# git completion
source ~/.scripts/git-completion.bash
source ~/.scripts/git-flow-completion.bash

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
[ -s "/home/lukas/.scm_breeze/scm_breeze.sh" ] && source "/home/lukas/.scm_breeze/scm_breeze.sh"
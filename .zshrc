# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/sebastian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt appendhistory beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Basic zsh config

export EDITOR='/usr/bin/vim'

# Set locale
export LC_ALL="en_DK.UTF-8"

# Use pacman-color

compdef _pacman pacman-color=pacman
alias pacman='pacman-color'

# aliases

alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# pass aliases through sudo

alias sudo='sudo '

# set prompt. Make red if root
autoload colors
colors
PROMPT="%{%(#~$fg[red]~$fg[default])%}%n%{$fg[default]%}@%m %2~ %{%(#~$fg[red]~$fg[default])%}%#%{$fg[default]%} "

# add rubygems to $PATH
PATH=$PATH:~/.gem/ruby/1.9.1/bin

# set timezone
export TZ=Europe/Copenhagen


# tmux

#if ["$TMUX" != ""]
#  then if  tmux list-windows | grep "(active)"
#    then echo 'hello'
#    else exec tmux new-window
#    fi
#fi
#[[ $- != *i* ]] && return
#[[ $TERM != screen* ]] && exec tmx main 

#if [[ "$TMUX" = "" ]]
#  then /home/sebastian/bin/tmx main
#  then tmux
#  else tmux previous-window
#fi

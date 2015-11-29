#!/bin/sh

eval "$(rbenv init -)"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls="ls -G "
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export CLICOLOR=1

# Pretty less
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# Enable vi mode one the command line
set -o vi

# Ofcourse edit with vim
export EDITOR=vim

# Setup the path
PATH="/usr/local/share/npm/bin:$PATH"       # Add the global npm bins to the path
PATH="/usr/local/bin:/usr/local/sbin:$PATH" # Add to keep brew happy
PATH="./node_modules/.bin:$PATH"            # Add the local node modules bins
PATH="$HOME/pear/bin:$PATH"                 # Pear bins
PATH="/usr/local/share/npm/bin:$PATH"       # Add the global npm bins to the path
PATH="$PATH:$HOME/bin"                      # Custom bin
PATH="$HOME/.rbenv/bin:$PATH"               # Add rbenv bins to the path
PATH="./bin:$PATH"                          # Add local workspace binstubs to the path

export PATH

# Paths
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

# Find where powerline is installed
export POWERLINE_PATH="$(pip show powerline-status | grep "^Location: "  | grep -o '/.*')/powerline"

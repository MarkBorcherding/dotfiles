#!/bin/sh


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

export EDITOR='vim'
alias e='emacsclient --tty --alternate-editor=""'
alias eg='emacsclient --alternate-editor="" --create-frame --no-wait'

# Setup the path
PATH="/usr/local/bin:$PATH"                 # Add the homebrew stuff before the existing bins
PATH="./node_modules/.bin:$PATH"            # Add the local node modules bins
PATH="$HOME/pear/bin:$PATH"                 # Pear bins
PATH="$HOME/bin:$PATH"                      # Custom bin
PATH="$HOME/.rbenv/bin:$PATH"               # Add rbenv bins to the path
PATH="./bin:$PATH"                          # Add local workspace binstubs to the path
PATH="/opt/chefdk/bin:$PATH"                # Put chefdk on the path infront of rbenv shims
PATH="$HOME/.cargo/bin:$PATH"               # rust stuff

export PATH

# Paths
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

export NVM_DIR="$HOME/.nvm"
[ -f "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"

eval "$(rbenv init -)"

# Find where powerline is installed
export POWERLINE_PATH="$(pip show powerline-status | grep "^Location: "  | grep -o '/.*')/powerline"

ssh-add -A 2>/dev/null;

[ -d ${HOME}/.profile.d ] && for f in ${HOME}/.profile.d/*(N); do source "$f"; done;

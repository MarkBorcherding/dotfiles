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
PATH="$HOME/.local/bin:$PATH"               # Haskell stack
PATH="$HOME/.cargo/bin:$PATH"               # rust stuff
PATH="$HOME/bin:$PATH"                      # Custom bin
PATH="$HOME/.rbenv/bin:$PATH"               # Add rbenv bins to the path

# I don't think I'm using this anymore and it is a little less safe since git could drop some unexpected
# binary in there
# PATH="./bin:$PATH"                          # Add local workspace binstubs to the path

# nvm.....you're a pain...this is what I was doing to set it up
#export NVM_DIR="$HOME/.nvm"
#[ -f "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
#export NODE_VERSION="$(nvm current)"
#export NODE_PATH="$HOME/.nvm/versions/node/$NODE_VERSION"
#export PATH="$NODE_PATH/bin:$PATH"

# This is what the install script wanted to do
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH

eval "$(rbenv init -)"

ssh-add -A 2>/dev/null;

[ -d ${HOME}/.profile.d ] && for f in ${HOME}/.profile.d/*(N); do source "$f"; done;

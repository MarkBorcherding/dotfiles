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

export EDITOR='emacsclient --tty --alternate-editor=""'
alias e='emacsclient --tty --alternate-editor=""'
alias eg='emacsclient --alternate-editor="" --create-frame --no-wait'

# Add the directories from files found in /etc/path.d
if [ -x /usr/libexec/path_helper ]; then
	  eval `/usr/libexec/path_helper -s`
fi

# Setup the path
PATH="/usr/local/bin:$PATH"                 # Add the homebrew stuff before the existing bins
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/.local/bin:$PATH"               # Haskell stack
PATH="$HOME/.cargo/bin:$PATH"               # rust stuff
PATH="$HOME/bin:$PATH"                      # Custom bin
PATH="$HOME/.rbenv/bin:$PATH"               # Add rbenv bins to the path

# This is what the install script wanted to do
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 2>/dev/null  # This loads nvm

eval "$(rbenv init -)"

export PATH

ssh-add -A 2>/dev/null;

[ -d ${HOME}/.profile.d ] && for f in ${HOME}/.profile.d/*(N); do source "$f"; done;

#!/bin/zsh

source "$HOME/.profile"

# Turn off the spelling correct.
unsetopt correct_all

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle battery
antigen bundle brew
antigen bundle colorize
antigen bundle command-not-found
antigen bundle git
antigen bundle osx
antigen bundle scala
antigen bundle sbt
antigen bundle tmux
antigen bundle vault

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle lukechilds/zsh-nvm

antigen theme markborcherding/zsh-plugins themes/fooberry

# Tell antigen that you're done.
antigen apply

# Silly 10-Keypad
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

bindkey "^R" history-incremental-search-backward

alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

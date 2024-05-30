#!/bin/zsh
source "$HOME/.profile"

# list all the commands being executed to help debugging speed
# set -x


# Turn off the spelling correct.
unsetopt correct_all
export ZSH_THEME_RUBY_VERSION="N"

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle brew
antigen bundle colorize
antigen bundle command-not-found
antigen bundle git
antigen bundle macos
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle Aloxaf/fzf-tab

#antigen bundle lukechilds/zsh-nvm

antigen theme denysdovhan/spaceship-prompt

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

# no longer using yarn
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Switch to emacs mode on the prompt
bindkey -e

for file in ~/.zsh.d/**; do
    source "$file"
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

## opam configuration
#[[ ! -r /Users/borcherm/.opam/opam-init/init.zsh ]] || source /Users/borcherm/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc




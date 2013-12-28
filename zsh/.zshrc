# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  battery
  brew
  osx
  vagrant
  vi-mode
  colored-man
  bower

  capistrano
  rails
  ruby
  rake
  rvm
  gem
  pow
  bundler
  coffee

  git
  git-remove-branch
  github

  node
  npm
)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias ls="ls -G"

unsetopt auto_name_dirs

# Multiple Move
# example:  mmv *.data *.backup_data
autoload -U zmv
alias mmv='noglob zmv -W'

# Colors
autoload -U colors
colors
setopt prompt_subst

# Turn off the spelling correct.
unsetopt correct_all

[ -r "$HOME/.zsh/prompt" ] && source "$HOME/.zsh/prompt"
[ -r "$HOME/.path" ] && source "$HOME/.path"

# Show completion on first TAB
setopt menucomplete

# # Load completions for Ruby, Git, etc.
autoload compinit
compinit

# RVM
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

[[ -s $HOME/.secrets ]] && source $HOME/.secrets


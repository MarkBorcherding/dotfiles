#!/bin/sh

export TERM='xterm-256color'

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export CLICOLOR=1

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'


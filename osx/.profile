export PATH=~/bin:/usr/local/bin:$PATH:
alias ls="ls -G"



initializeANSI()
{
  esc=""

  blackf="${esc}[0;30m";   redf="${esc}[0;31m";    greenf="${esc}[0;32m"
  yellowf="${esc}[0;33m"   bluef="${esc}[0;34m";   purplef="${esc}[0;35m"
  cyanf="${esc}[0;36m";    whitef="${esc}[0;37m"

  bblackf="${esc}[1;30m";   bredf="${esc}[1;31m";    bgreenf="${esc}[1;32m"
  byellowf="${esc}[1;33m"   bbluef="${esc}[1;34m";   bpurplef="${esc}[1;35m"
  bcyanf="${esc}[1;36m";    bwhitef="${esc}[1;37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2 
                then
                        color="${greenf}"
                else
                        color=${redf}
                fi
        else
                return 0
        fi
        echo -ne $color
}


# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb

export PS1='\[${blackf}\u@\h${reset} ${bgreenf}\w${reset} $(branch_color)$(parse_git_branch)${whitef}\$${reset} '

export PATH=~/bin:/usr/local/bin:$PATH:
alias ls="ls -G"


export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb

initializeANSI()
{


  blackf="\[\e[0;30m\]";   redf="\[\e[0;31m\]";    greenf="\[\e[0;32m\]";
  yellowf="\[\e[0;33m"   bluef="\[\e[0;34m\]";   purplef="\[\e[0;35m\]";
  cyanf="\[\e[0;36m\]";    whitef="\[\e[0;37m"

  bblackf="\[\e[1;30m\]";   bredf="\[\e[1;31m\]";    bgreenf="\[\e[1;32m\]";
  byellowf="\[\e[1;33m"   bbluef="\[\e[1;34m\]";   bpurplef="\[\e[1;35m\]";
  bcyanf="\[\e[1;36m\]";    bwhitef="\[\e[1;37m\]";
  
  blackb="\[\e[40m\]";   redb="\[\e[41m\]";    greenb="\[\e[42m\]";
  yellowb="\[\e[43m"   blueb="\[\e[44m\]";   purpleb="\[\e[45m\]";
  cyanb="\[\e[46m\]";    whiteb="\[\e[47m\]";

  boldon="\[\e[1m\]";    boldoff="\[\e[22m\]";
  italicson="\[\e[3m\]"; italicsoff="\[\e[23m\]";
  ulon="\[\e[4m\]";      uloff="\[\e[24m\]";
  invon="\[\e[7m\]";     invoff="\[\e[27m\]";

  reset="\[\e[0m\]";
}

initializeANSI

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

branch_color()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2 
                then
                        color="$bgreenf"
                else
                        color="$bredf"
                fi
        else
                return 0
        fi
        echo -ne $color
}

setup_prompt(){
export PS1="${blackf}\u@\h ${bblackf} \w $(branch_color)$(__git_ps1)${reset} \$ "
}

PROMPT_COMMAND=setup_prompt



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

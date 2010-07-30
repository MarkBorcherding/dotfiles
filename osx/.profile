export PATH=~/bin:/usr/local/bin:$PATH:
alias ls="ls -G"


export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb

initializeANSI()
{


  blackf="\[\e[0;30m\]";   redf="\[\e[0;31m\]";    greenf="\[\e[0;32m\]";
  yellowf="\[\e[0;33m";   bluef="\[\e[0;34m\]";   purplef="\[\e[0;35m\]";
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




function count_git_changes(){
    git_staged_added=0;
    git_staged_deleted=0;
    git_staged_modified=0;
    git_added=0;
    git_deleted=0;
    git_modified=0;
    git_untracked=0;
    git_staged_renamed=0;


    origIFS=$IFS
    IFS=$'\n'
    for line in $(git status -sb 2>/dev/null);
    do
    
        if [[ "$line" =~ ^\?\? ]]
        then
         let "git_untracked = git_untracked + 1"
        fi 
    
        if [[ "$line" =~ ^.M ]]
        then
         let "git_modified = git_modified + 1"
        fi
    
        if [[ "$line" =~ ^.D ]]
        then
         let "git_deleted = git_deleted + 1"
        fi
    
        if [[ "$line" =~ ^A ]]
        then
         let "git_staged_added = git_staged_added + 1"
        fi
    
        if [[ "$line" =~ ^M ]]
        then
         let "git_staged_modified = git_staged_modified + 1"
        fi
        
       if [[ "$line" =~ ^R ]]
       then
        let "git_staged_renamed = git_staged_renamed + 1"
       fi        
    
        if [[ "$line" =~ ^D ]]
        then
         let "git_staged_deleted = git_deleted + 1"
        fi
    done
    IFS=$orifIFS

    let "git_staged=git_staged_added+git_staged_deleted+git_staged_modified+git_staged_renamed"
    let "git_changed=git_staged+git_untracked+git_deleted+git_modified"

}



branch_color()
{
 
 if [ $git_staged -ne 0 ]; then
    echo -ne "${byellowf}"
 elif [ $git_changed -ne 0 ]; then
    echo -ne "${bredf}"
 else 
    echo -ne "${bgreenf}"
 fi

}


parse_git_branch_name(){
    git_branch_name="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')"
}

git_prompt(){
   parse_git_branch_name
    
  if [ -z $git_branch_name ]; then
     echo -ne ""
  else
     echo -ne "${bblackf}("
     branch_color
     echo -ne "$git_branch_name"
     show_if_exists "$git_staged_added"  "+"  "${byellowf}"
     show_if_exists "$git_staged_deleted"  "-"  "${byellowf}"
     show_if_exists "$git_staged_modified"  "~"  "${byellowf}"
     show_if_exists "$git_staged_renamed"  "->"  "${byellowf}"
     show_if_exists "$git_added"  "+"  "${bgreenf}"
     show_if_exists "$git_deleted"  "-"  "${bredf}"
     show_if_exists "$git_modified"  "~"  "${bbluef}"
     show_if_exists "$git_untracked"  "?"  "${yellowf}"   
     echo -ne "$bblackf)${reset}"
   fi
}

show_if_exists(){
    if [ $1 -ne 0 ]; then
        echo -ne "$3"
        
        if [ $1 -ne 0 ]; then
            echo -ne " $2$1"
        fi
    fi   
}

setup_prompt(){
     count_git_changes
     export PS1="${blackf}\u@\h ${bblackf} \w $(git_prompt)${reset} \$ "
}

PROMPT_COMMAND=setup_prompt



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

. "$executingScriptDirectory/gitutils.ps1"
. "$executingScriptDirectory/gitPromptUtils.ps1"
. "$executingScriptDirectory/ssh-agent-utils.ps1"


$env:TERM='cygwin'

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module ./posh-git



if(-not (Test-Path Function:\DefaultTabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include git expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # Execute git tab completion for all git-related commands
        'git (.*)' { GitTabExpansion $lastBlock }
        # Fall back on existing tab expansion
        default { DefaultTabExpansion $line $lastWord }
    }
}

Enable-GitColors

Pop-Location

function shortenPwd(){
  $s = $pwd.Path.split("\")

  if($s.length -ne 2){
    $p = $s[0]
    for($i=1; $i -le $s.length-2; $i++){
      $p += "\" + $s[$i].substring(0,1)
    }
    return $p + "\" + $s[$s.length-1]
  } else {
   return $pwd
  }
}

function prompt {
  $path = shortenPwd
  Write-Host($path) -nonewline -foregroundcolor DarkGray     
  Write-GitBranch
  Write-Host('>') -nonewline -foregroundcolor DarkGray    
  return " "
}



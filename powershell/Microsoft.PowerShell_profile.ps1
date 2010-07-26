$env:TERM='cygwin'

. (Resolve-Path ~/Documents/WindowsPowershell/gitutils.ps1)
. (Resolve-Path ~/Documents/WindowsPowershell/gitPromptUtils.ps1)
. (Resolve-Path ~/Documents/WindowsPowershell/ssh-agent-utils.ps1)

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module d:\vendor\posh-git

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


function prompt {
	$path = [string]$pwd
    Write-Host($path) -nonewline -foregroundcolor DarkGray     
    Write-GitBranch
	Write-Host('>') -nonewline -foregroundcolor DarkGray    
	return " "
}



$env:TERM='cygwin'

. (Resolve-Path ~/Documents/WindowsPowershell/gitutils.ps1)
. (Resolve-Path ~/Documents/WindowsPowershell/gitPromptUtils.ps1)
. (Resolve-Path ~/Documents/WindowsPowershell/ssh-agent-utils.ps1)

function prompt {
	$path = [string]$pwd
    Write-Host($path) -nonewline -foregroundcolor DarkGray     
    Write-GitBranch
	Write-Host('>') -nonewline -foregroundcolor DarkGray    
	return " "
}


# Installation

This assumes you have installed the msysgit tools to the console path. Also, that you have cloned the [posh-git](http://github.com/dahlbyk/posh-git.git) repository somewhere. You should also have the [sysinternals](http://technet.microsoft.com/en-us/sysinternals/bb842062.aspx) tools on the path somewhere.

    cd ~/documents
    if( !(Test-Path WindowsPowerShell) ){ mkdir WindowsPowerShell }
    cd WindowsPowerShell
    echo . "~\documents\WindowsPowerShell\roaming-profile\Microsoft.PowerShell_profile.ps1" > Microsoft.PowerShell_profile.ps1
    junction roaming-profile <path to your roaming profile repository>\powershell 
    cd roaming-profile
    junction posh-git <path to your posh-git repository>

Exit the console and start it back up and you should get the new prompt.

## Links
 * Posh-git : http://github.com/dahlbyk/posh-git

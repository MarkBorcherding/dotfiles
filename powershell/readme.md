# Installation

This assumes you have installed the msysgit tools to the console path. Also, that you have cloned the [posh-git](http://github.com/dahlbyk/posh-git.git) repository somewhere.

    cd ~/documents
    if( !(Test-Path WindowsPowerShell) ){ mkdir WindowsPowerShell }
    cd WindowsPowerShell
    echo . "~\documents\WindowsPowerShell\roaming-profile\Microsoft.PowerShell_profile.ps1" > Microsoft.PowerShell_profile.ps1
    ln -sd <path to your roaming profile repository>\powershell roaming-profile
    cd roaming-profile
    ln -sd <path to your posh-git repository> posh-git

Exit the console and start it back up and you should get the new prompt.

## Links
 * Posh-git : http://github.com/dahlbyk/posh-git

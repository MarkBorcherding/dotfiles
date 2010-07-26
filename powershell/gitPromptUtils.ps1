
function gitBranchColor {
	$color = "Green"
	git status -s | foreach {	    
    	return $color = "Red";		    
	}
	return $color;
}

function Write-GitBranch(){
    if (isCurrentDirectoryGitRepository) {        
        $currentBranch = gitBranchName
		$color = gitBranchColor        
        Write-Host(' (') -nonewline -foregroundcolor Gray
        Write-Host($currentBranch) -nonewline -foregroundcolor $color    
        Write-Host(') ') -nonewline -foregroundcolor Gray 
    }    
}

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
		#$color = gitBranchColor        
		$status = myGitStatus
		$color = 'Red'
		if($status.totalchanges -match 0){
			$color = 'Green'
		}		
        Write-Host(' (') -nonewline -foregroundcolor Gray
        Write-Host($currentBranch) -nonewline -foregroundcolor $color 
        
        
        if($status.added -gt 0){
        	Write-Host(' +' + $status.added) -nonewline -foregroundcolor DarkGreen        	
        }
        
        if($status.deleted -gt 0){
        	Write-Host(' -' + $status.deleted) -nonewline -foregroundcolor DarkRed        	
        }
        
        if($status.modified -gt 0){
        	Write-Host(' ~' + $status.modified) -nonewline -foregroundcolor DarkCyan        	
        }
        
        if($status.untracked -gt 0){
        	Write-Host(' ?' + $status.untracked) -nonewline -foregroundcolor DarkYellow        	
        }                        
        
           
        Write-Host(') ') -nonewline -foregroundcolor Gray 
    }    
}

function myGitStatus {
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
        
    $output = git status -s
    
    $output | foreach {
        
        if ($_ -match "^ D") {
            $deleted += 1
        }
        elseif (($_ -match "^ M") ) {
            $modified += 1
        }
        elseif ($_ -match "^A") {
            $added += 1
        }
        elseif ($_ -match "^\?\?") {
            $untracked += 1
        }
    }
    
    return @{"untracked" = $untracked;
             "added" = $added;
             "modified" = $modified;
             "deleted" = $deleted;    
             "totalchanges" = $untracked + $added + $modified + $deleted;         
             }
}
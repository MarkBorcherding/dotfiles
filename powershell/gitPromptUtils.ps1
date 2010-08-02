
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
		if($status.staged_changes -gt 0){
			$color = 'Yellow'
		} 
		elseif($status.totalchanges -match 0){
			$color = 'Green'
		}		
        Write-Host(' (') -nonewline -foregroundcolor Gray
        Write-Host($currentBranch) -nonewline -foregroundcolor $color 
        
        
        if($status.staged_added -gt 0){
        	Write-Host(' +' + $status.staged_added) -nonewline -foregroundcolor DarkYellow        	
        }
        
        if($status.staged_deleted -gt 0){
        	Write-Host(' -' + $status.staged_deleted) -nonewline -foregroundcolor DarkYellow        	
        }
        
        if($status.staged_modified -gt 0){
        	Write-Host(' ~' + $status.staged_modified) -nonewline -foregroundcolor DarkYellow        	
        }
        
        if($status.staged_rename -gt 0){
        	Write-Host(' ->' + $status.staged_rename) -nonewline -foregroundcolor DarkYellow        	
        }
        
        if($status.added -gt 0){
        	Write-Host(' +' + $status.added) -nonewline -foregroundcolor DarkRed        	
        }
        
        if($status.deleted -gt 0){
        	Write-Host(' -' + $status.deleted) -nonewline -foregroundcolor DarkRed        	
        }
        
        if($status.modified -gt 0){
        	Write-Host(' ~' + $status.modified) -nonewline -foregroundcolor DarkRed        	
        }
        
        if($status.untracked -gt 0){
        	Write-Host(' ?' + $status.untracked) -nonewline -foregroundcolor DarkRed        	
        }                        
        
        
        if($status.upstream_changes -gt 0){
        	Write-Host(' ^' + $status.upstream_changes) -nonewline -foregroundcolor DarkRed        	
        }                        
        
        
           
        Write-Host(') ') -nonewline -foregroundcolor Gray 
    }    
}

function myGitStatus {
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
    $staged_added = 0
    $staged_modified = 0
    $staged_deleted = 0
    $staged_rename = 0
    $upstream_changes = 0
        
    $output = git status -s
    
    $output | foreach {
        
        if ($_ -match "^ D") {
            $deleted += 1
        }
        elseif (($_ -match "^ M") ) {
            $modified += 1
        }
        elseif ($_ -match "^ A") {
            $added += 1
        }
        elseif ($_ -match "^\?\?") {
            $untracked += 1
        }
        elseif (($_ -match "^M") ) {
            $staged_modified += 1
        }
        elseif ($_ -match "^A") {
            $staged_added += 1
        }
        elseif ($_ -match "^D") {
            $staged_deleted += 1
        }
        elseif ($_ -match "^R") {
            $staged_rename += 1
        }
        elseif ($_ -match "^UU") {
            $upstream_changes += 1
        }
        
    }
    
    return @{"untracked" = $untracked;
             "added" = $added;
             "modified" = $modified;
             "deleted" = $deleted;    
             "staged_added" = $staged_added;
             "staged_modified" = $staged_modified;
             "staged_deleted" = $staged_deleted;    
             "staged_rename" = $staged_rename;    
             "staged_changes" = $staged_added + $staged_deleted + $staged_modified + $staged_rename;
             "totalchanges" = $untracked + $added + $modified + $deleted + $staged_added + $staged_deleted + $staged_modified + $staged_rename + $upstream_changes ;         
             }
}
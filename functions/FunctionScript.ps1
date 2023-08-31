#switch through credentials based on the server passed to the function.
#good for loops and lists
function Set-QCredsForServer {
    <#
    .SYNOPSIS
    Automatically sets credentials for the server in question, used for loops.
    
    .DESCRIPTION
    Uses a regex switch credentials for servers used for loops, takin the server name as a parameter.
    This can also be used outside of loops for setting credentials to a server parameter passed to the function.
    
    .PARAMETER svr
    Fully qualified server name
    
    .EXAMPLE
    $myCredential = QSet-CredsForServer -svr $chosenServer
    
    .NOTES
    Based on and furthered from the Get/Set-Qcred function as part of the Qcorp module.
    #>
    param (
        [Parameter(Mandatory = $true)] 
        [string]$svr 
    )
    $CmdCred = switch -regex ($svr) {
        'skandia' {(Get-QCred AFSUKDMN01)}
        'core|corporate|intrinsic' { (Get-QCred core.local) }
        'nomad' { (Get-QCred nomad.ic) }
        Default {}
    }
    $FDISplat = @{
        ComputerName = $svr
    }
    if ($CmdCred) { $FDISplat.Credential = $CmdCred }

    return $CmdCred
}
#endregion
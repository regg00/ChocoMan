Function Get-ChocoPackage {
    <#
    .SYNOPSIS
        Get a specific locally installed chocolatey package.
    .DESCRIPTION    
        Get a specific locally installed chocolatey package.
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([String])]
    param(
        [String] $Name
    )

    if (Test-ChocoInstalled) {        
        $ChocoPackage = Get-ChocoPackages | Where-Object { $_.Name -eq $Name }
        Return $ChocoPackage
    }
}
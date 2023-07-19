Function Get-ChocoPackage {
    <#
    .SYNOPSIS
        Get a specific locally installed chocolatey package.
    .DESCRIPTION    
        Get a specific locally installed chocolatey package.
    .EXAMPLE
        Get-ChocoPackage -Name vlc
        Name Version
        ---- -------
        vlc  3.0.18

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String] $Name
    )

    if (Test-ChocoInstalled) {        
        $ChocoPackage = Get-ChocoPackages | Where-Object { $_.Name -eq $Name }
        Return $ChocoPackage
    }
}
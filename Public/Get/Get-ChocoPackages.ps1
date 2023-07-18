Function Get-ChocoPackages {
    <#
    .SYNOPSIS
        Get the list of all installed chocolatey packages.
    .DESCRIPTION    
        Get the list of all installed chocolatey packages.
    .EXAMPLE
        Get-ChocoPackages
        Name             Version
        ----             -------        
        github-desktop   3.2.3
        vlc              3.0.18
    
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param()

    if (Test-ChocoInstalled) {
        $Header = "Name", "Version"
        $ChocoPackages = ConvertFrom-Csv (choco list -r --nocolor) -Delimiter '|' -Header $Header
        Return $ChocoPackages
    }

}
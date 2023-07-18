Function Get-ChocoOutdated {
    <#
    .SYNOPSIS
        Get the list of outdated chocolatey packages.
    .DESCRIPTION    
        Get the list of outdated chocolatey packages.
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param()

    if (Test-ChocoInstalled) {
        $Header = "Name", "CurrentVersion", "AvailableVersion", "Pinned"
        $ChocoPackages = ConvertFrom-Csv (choco outdated -r --nocolor) -Delimiter '|' -Header $Header
        Return $ChocoPackages
    }

}
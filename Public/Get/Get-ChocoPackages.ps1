Function Get-ChocoPackages {
    <#
    .SYNOPSIS
        Get the list of all installed chocolatey packages.
    .DESCRIPTION    
        Get the list of all installed chocolatey packages.
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param()

    if (Test-ChocoInstalled) {
        $Header = "Name", "Version"
        $ChocoPackages = ConvertFrom-Csv (choco list -lo -r --nocolor) -Delimiter '|' -Header $Header
        Return $ChocoPackages
    }

}
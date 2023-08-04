Function Get-ChocoOutdated {
    <#
    .SYNOPSIS
        Get the list of outdated chocolatey packages.
    .DESCRIPTION
        Get the list of outdated chocolatey packages.
    .EXAMPLE
        Get-ChocoOutdated
        Name             CurrentVersion AvailableVersion Pinned
        ----             -------------- ---------------- ------
        adobereader      2023.3.20201.1 2023.003.20215   false
        github-desktop   3.2.3          3.2.6            false

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param()

    if (Test-ChocoInstalled) {
        $Header = "Name", "CurrentVersion", "AvailableVersion", "Pinned"
        $ChocoPackages = ConvertFrom-Csv (Invoke-ChocoCommand -Arguments "outdated").RawOutput -Delimiter '|' -Header $Header
        Return $ChocoPackages
    }

}

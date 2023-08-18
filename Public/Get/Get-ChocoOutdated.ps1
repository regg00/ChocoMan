Function Get-ChocoOutdated {
    <#
    .SYNOPSIS
        Get the list of outdated chocolatey packages.
    .DESCRIPTION
        Get the list of outdated chocolatey packages.

    .PARAMETER Source
        The source to get the list of outdated packages from.

    .PARAMETER PreRelease
        Include pre-release versions in the search.

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
    param(
        [String] $Source,
        [Switch] $PreRelease = $false
    )

    if (Test-ChocoInstalled) {

        [String[]]$Arguments = "outdated"

        if ($Source) {
            $Arguments += "-source", $Source
        }

        if ($PreRelease) {
            $Arguments += "--pre"
        }

        $Header = "Name", "CurrentVersion", "AvailableVersion", "Pinned"
        $ChocoPackages = ConvertFrom-Csv (Invoke-ChocoCommand -Arguments $Arguments).RawOutput -Delimiter '|' -Header $Header
        Return $ChocoPackages | Where-Object { $_.Name -ne "[NuGet] No Authorization header detected" }
    }

}

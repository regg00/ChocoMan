Function Search-ChocoPackage {
    <#
    .SYNOPSIS
        Search for a chocolatey package. If no name is specified this will return all available packages.
    .DESCRIPTION
        Search for a chocolatey package.  If no name is specified this will return all available packages.
    .PARAMETER Name
        The name of the package to search for. Omit to return all available packages.
    .PARAMETER Source
        Search on a specific source. Defaults to the official Chocolatey repository.
    .PARAMETER Exact
        Search for an exact match.

    .EXAMPLE
        Search-ChocoPackage -Name "rufus"
        Name                Version
        ----                -------
        rufus                 3.0.18
        rufus.install         3.0.18
        rufus.portable        3.0.18
        rufus-nightly         4.0.0.20230713

    .EXAMPLE
        Search-ChocoPackage -Name "rufus" -Source "chocolatey"
        Name                Version
        ----                -------
        rufus                 3.0.18
        rufus.install         3.0.18
        rufus.portable        3.0.18
        rufus-nightly         4.0.0.20230713

    .EXAMPLE
        Search-ChocoPackage -Name "rufus" -Source "chocolatey" -Exact
        Name Version
        ---- -------
        rufus  3.0.18

    .EXAMPLE
        Search-ChocoPackage
        Name                Version
        ----                -------
        rufus                 3.0.18
        rufus.install         3.0.18
        ...                 ...
        ...                 ...

    .OUTPUTS
        PSCustomObject

    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Position = 0)]
        [String] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Exact
    )

    if (Test-ChocoInstalled) {
        $Header = "Name", "Version"
        [String[]]$Arguments = "search", $Name, "--source", $Source
        Try {

            if ($Exact) {
                $Arguments += "--exact"
            }

            $CommandOutput = Invoke-ChocoCommand $Arguments
            if ($CommandOutput.Status -eq "Success") {
                Return ConvertFrom-Csv $CommandOutput.RawOutput -Delimiter '|' -Header $Header
            }

        }
        Catch {
            Write-Error $_.Exception.Message
        }
    }

}

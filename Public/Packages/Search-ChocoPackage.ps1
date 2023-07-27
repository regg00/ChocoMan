Function Search-ChocoPackage {
    <#
    .SYNOPSIS
        Search for a chocolatey package.
    .DESCRIPTION
        Search for a chocolatey package.
    .PARAMETER Name
        The name of the package to search for.
    .PARAMETER Source
        Search on a specific source.
    .PARAMETER Exact
        Search for an exact match.

    .EXAMPLE
        Search-ChocoPackage -Name "vlc"
        Name                Version
        ----                -------
        vlc                 3.0.18
        vlc.install         3.0.18
        vlc.portable        3.0.18
        vlc-nightly         4.0.0.20230713

    .EXAMPLE
        Search-ChocoPackage -Name "vlc" -Source "chocolatey"
        Name                Version
        ----                -------
        vlc                 3.0.18
        vlc.install         3.0.18
        vlc.portable        3.0.18
        vlc-nightly         4.0.0.20230713
    .EXAMPLE
        Search-ChocoPackage -Name "vlc" -Source "chocolatey" -Exact
        Name Version
        ---- -------
        vlc  3.0.18
    .OUTPUTS
        PSCustomObject

    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
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

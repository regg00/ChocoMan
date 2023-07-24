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
        Try {

            if ($Exact) {
                $ChocoPackages = ConvertFrom-Csv (choco search $Name -s $Source -r --exact --nocolor) -Delimiter '|' -Header $Header
            }
            else {
                $ChocoPackages = ConvertFrom-Csv (choco search $Name -s $Source -r --nocolor) -Delimiter '|' -Header $Header
            }
            Return $ChocoPackages
        }
        Catch [System.Management.Automation.ParameterBindingException] {
            Write-Verbose "No package found with name '$Name' on source '$Source'."
            Return $null
        }
    }

}

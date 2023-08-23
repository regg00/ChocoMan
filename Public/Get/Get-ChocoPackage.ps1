Function Get-ChocoPackage {
    <#
    .SYNOPSIS
        Get a specific locally installed chocolatey package. Returns all packages if no name is specified.
    .DESCRIPTION
        Get a specific locally installed chocolatey package. Returns all packages if no name is specified.
    .PARAMETER Name
        The name of the package to get.
    .PARAMETER Outdated
        Get only outdated packages.
    .EXAMPLE
        Get-ChocoPackage -Name rufus
        Name Version
        ---- -------
        rufus  3.0.18
    .EXAMPLE
        Get-ChocoPackage -Outdated
        Name                              CurrentVersion    AvailableVersion Pinned
        ----                              --------------    ---------------- ------
        7zip                              22.1.0            23.1.0           false
        7zip.install                      22.1.0            23.1.0           false

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String] $Name,
        [Switch] $Outdated,
        [Switch] $Details
    )

    if (Test-ChocoInstalled) {

        if ($Details) {
            Write-Verbose "Gettings details of a package"
            $ChocoCommandOutput = Invoke-ChocoCommand -Arguments "info", $Name, "--no-color" -ErrorAction SilentlyContinue -BypassDefaultArgs

            Return [PSCustomObject]@{
                Title             = ($ChocoCommandOutput.RawOutput | Select-String -Raw -Pattern "^ Title:.*$").Replace("Title: ", "").Split("|")[0].Trim()
                NumberOfDownloads = ($ChocoCommandOutput.RawOutput | Select-String -Raw -Pattern "^ Number of Downloads: ([0-9]+)").Replace("Number of Downloads: ", "").Split("|")[0].Trim()
                Checksum          = ($ChocoCommandOutput.RawOutput | Select-String -Raw -Pattern "^ Package Checksum:.*$").Replace("Package Checksum: ", "").Replace("(SHA512)", "").Replace("'", "").Trim()
                Tags              = ($ChocoCommandOutput.RawOutput | Select-String -Raw -Pattern "^ Tags: .*$").Replace("Tags: ", "").Trim()
                Summary           = ($ChocoCommandOutput.RawOutput | Select-String -Raw -Pattern "^ Summary: .*$").Replace("Summary: ", "").Trim()
                Description       = ($ChocoCommandOutput.RawOutput | Select-String -AllMatches -Raw -Pattern "^ Description:((.|\n)*)").Replace("Description:", "").Trim()
            }


        }
        else {
            $ChocoCommandOutput = Invoke-ChocoCommand -Arguments "list" -ErrorAction SilentlyContinue
            if ($Outdated) {
                Return Get-ChocoOutdated
            }
            $Header = "Name", "Version"
            if ($Name) {
                Return ConvertFrom-Csv $ChocoCommandOutput.RawOutput -Delimiter '|' -Header $Header | Where-Object { $_.Name -eq $Name }
            }
            else {
                Return ConvertFrom-Csv $ChocoCommandOutput.RawOutput -Delimiter '|' -Header $Header
            }
        }


    }
}

Function Get-ChocoPackage {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER Name
        The name of the package to get.
    .EXAMPLE
        Get-ChocoPackageInfo -Name rufus
        Name Version
        ---- -------
        rufus  3.0.18

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String] $Name
    )

    if (Test-ChocoInstalled) {


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
}

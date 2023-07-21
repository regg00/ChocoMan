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
        Get-ChocoPackage -Name vlc
        Name Version
        ---- -------
        vlc  3.0.18
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
        [Switch] $Outdated
    )    

    if (Test-ChocoInstalled) { 
        $ChocoCommandOutput = Invoke-ChocoCmd -Arguments "list" -ErrorAction SilentlyContinue 
        if ($Outdated) {
            Return Get-ChocoOutdated
        }      
        $Header = "Name", "Version"
        if ($Name) {            
            Return ConvertFrom-Csv $ChocoCommandOutput -Delimiter '|' -Header $Header | Where-Object { $_.Name -eq $Name }
        }
        else {
            Return ConvertFrom-Csv $ChocoCommandOutput -Delimiter '|' -Header $Header
        }        
    }
}
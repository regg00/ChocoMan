Function Get-ChocoSources {
    <#
    .SYNOPSIS
        Get the list of chocolatey sources.
    .DESCRIPTION
        Get the list of chocolatey sources.
    .EXAMPLE
        Get-ChocoSources
        Name                Uri                                                 UserName     BypassProxy SelfService AdminOnly
        ----                ---                                                 --------     ----------- ----------- ---------        
        chocolatey          https://community.chocolatey.org/api/v2/                         0           False       False
                
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param()
    
    if (Test-ChocoInstalled) {
        $Header = "Name", "Uri", "Unknown0", "UserName", "Unknown1", "BypassProxy", "SelfService", "AdminOnly"
        $ChocoPackages = ConvertFrom-Csv (choco source list -r --nocolor) -Delimiter '|' -Header $Header
        Return $ChocoPackages | Select-Object Name, Uri, Username, BypassProxy, SelfService, AdminOnly
    }
}
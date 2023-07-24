Function Get-ChocoSource {
    <#
    .SYNOPSIS
        Retrieves the configured Chocolatey sources
    .DESCRIPTION
        Retrieves the configured Chocolatey sources
    .PARAMETER Name
        The name of the source to retrieve
    .EXAMPLE
        Get-ChocoSource
        Name                Uri                                              Disabled BypassProxy SelfService AdminOnly Priority User
        ----                ---                                              -------- ----------- ----------- --------- -------- ----
        chocolatey          https://community.chocolatey.org/api/v2/         false    false       false       false     0
        chocolatey.licensed https://licensedpackages.chocolatey.org/api/v2/  false    false       false       false     10       customer

    .EXAMPLE
        Get-ChocoSource -Name chocolatey
        Name       Uri                                      Disabled BypassProxy SelfService AdminOnly Priority User
        ----       ---                                      -------- ----------- ----------- --------- -------- ----
        chocolatey https://community.chocolatey.org/api/v2/ false    false       false       false     0

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String] $Name
    )

    if (Test-ChocoInstalled) {
        $Config = Import-ChocoConfig

        $Sources = $Config.chocolatey.sources.ChildNodes
        $Output = [System.Collections.ArrayList]::new()

        foreach ($Source in $Sources) {
            [void]$Output.Add(
                [PSCustomObject]@{
                    Name        = $Source.id
                    Uri         = $Source.value
                    Disabled    = $Source.disabled
                    BypassProxy = $Source.bypassProxy
                    SelfService = $Source.selfService
                    AdminOnly   = $Source.adminOnly
                    Priority    = $Source.priority
                    User        = $Source.user
                })
        }

        if ($Name) {
            $Output = $Output | Where-Object { $_.Name -eq $Name }
        }
        Return $Output
    }
}

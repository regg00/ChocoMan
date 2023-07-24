Function Get-ChocoConfig {
    <#
    .SYNOPSIS
        Retrieves the Chocolatey configuration
    .DESCRIPTION
        Retrieves the Chocolatey configuration
    .PARAMETER Name
        The name of the configuration to retrieve
    .EXAMPLE
        Get-ChocoConfig
        Name                                                      Value                             Description
        ---                                                       -----                             -----------
        cacheLocation                                                                               Cache location if not TEMP folder. Replaces `$env:TEMP` value for choco.exe pro…
        containsLegacyPackageInstalls                             true                              Install has packages installed prior to 0.9.9 series.
        commandExecutionTimeoutSeconds                            2700                              Default timeout for command execution. '0' for infinite.

    .EXAMPLE
        Get-ChocoConfig -Name cacheLocation
        Name          Value Description
        ----          ----- -----------
        cacheLocation       Cache location if not TEMP folder. Replaces `$env:TEMP` value for choco.exe process. It is highly recommended

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

        $Configs = $Config.chocolatey.config.ChildNodes
        $Output = [System.Collections.ArrayList]::new()

        foreach ($Config in $Configs) {
            [void]$Output.Add(
                [PSCustomObject]@{
                    Name        = $Config.key
                    Value       = $Config.value
                    Description = $Config.description
                })
        }
        if ($Name) {
            $Output = $Output | Where-Object { $_.Name -eq $Name }
        }
        Return $Output
    }
}

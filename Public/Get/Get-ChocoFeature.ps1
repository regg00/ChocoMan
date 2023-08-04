Function Get-ChocoFeature {
    <#
    .SYNOPSIS
        Retrieves the Chocolatey feature
    .DESCRIPTION
        Retrieves the Chocolatey feature
    .PARAMETER Name
        The name of the feature to retrieve
    .EXAMPLE
        Get-ChocoFeature
        Name                                                 Enabled SetExplicitly Description
        ----                                                 ------- ------------- -----------
        checksumFiles                                        true    false         Checksum files when pulled in from internet (based on package).
        autoUninstaller                                      true    false         Uninstall from programs and features without requiring an explicit uninstall script.
        allowGlobalConfirmation                              false   false         Prompt for confirmation in scripts or bypass.
        failOnAutoUninstaller                                false   false         Fail if automatic uninstaller fails.

    .EXAMPLE
        Get-ChocoFeature -Name checksumFiles
        Name          Enabled SetExplicitly Description
        ----          ------- ------------- -----------
        checksumFiles true    false         Checksum files when pulled in from internet (based on package).

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

        $Features = $Config.chocolatey.features.ChildNodes
        $Output = [System.Collections.ArrayList]::new()

        foreach ($Feature in $Features) {
            [void]$Output.Add(
                [PSCustomObject]@{
                    Name          = $Feature.name
                    Enabled       = $Feature.enabled
                    SetExplicitly = $Feature.setExplicitly
                    Description   = $Feature.description
                })
        }
        if ($Name) {
            $Output = $Output | Where-Object { $_.Name -eq $Name }
        }
        Return $Output
    }
}


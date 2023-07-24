Function Get-ChocoApiKey {
    <#
    .SYNOPSIS
        Retrieves an API key for a particular source
    .DESCRIPTION
        Retrieves an API key for a particular source
    .PARAMETER Source
        The source to retrieve the API key for

    .EXAMPLE
        Get-ChocoApiKey
        Source                 Key
        ------                 --------------
        https://chocolatey.org AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAxc9DNMivjki8zbeKBN8X5wQA
        https://cdfgdgdfdg.org AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAxc9DNMivjki8zbeKBN8X5wQA

    .EXAMPLE
        Get-ChocoApiKey -Source https://chocolatey.org
        Source                 Key
        ------                 ---
        https://chocolatey.org AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAxc9DNMivjki8zbeKBN8X5wQA

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String] $Source
    )

    if (Test-ChocoInstalled) {
        $Config = Import-ChocoConfig

        $ApiKeys = $Config.chocolatey.apiKeys.ChildNodes
        $Output = [System.Collections.ArrayList]::new()

        foreach ($ApiKey in $ApiKeys) {
            [void]$Output.Add(
                [PSCustomObject]@{
                    Source = $ApiKey.source
                    Key    = $ApiKey.key
                })
        }
        if ($Name) {
            $Output = $Output | Where-Object { $_.Name -eq $Name }
        }
        Return $Output
    }
}

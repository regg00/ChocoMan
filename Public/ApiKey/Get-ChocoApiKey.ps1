Function Get-ChocoApiKey {
    <#
    .SYNOPSIS
        Retrieves, saves or deletes an API key for a particular source
    .DESCRIPTION    
        Retrieves, saves or deletes an API key for a particular source
    .PARAMETER Source
        The source to retrieve, save or delete the API key for
        
    .EXAMPLE
        Get-ChocoApiKey -Source https://chocolatey.org
        Source                 Authentication
        ------                 --------------
        https://chocolatey.org (Authenticated)

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String] $Source
    )

    if (Test-ChocoInstalled) {  
        $Header = "Source", "Authentication"      
        $ChocoApiKey = ConvertFrom-Csv (choco apikey -r --nocolor) -Delimiter '|' -Header $Header
        Return $ChocoApiKey
    }
}
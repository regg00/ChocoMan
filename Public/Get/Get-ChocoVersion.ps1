Function Get-ChocoVersion {
    <#
    .SYNOPSIS
        Get the version of chocolatey.
    .DESCRIPTION    
        Get the version of chocolatey.
    .OUTPUTS
        String
    #>
    [CmdletBinding()]
    [OutputType([String])]
    param()

    if (Test-ChocoInstalled) {
        $chocoVersion = (choco -v -limitoutput -nocolor)
        Write-Output $chocoVersion
    }
}
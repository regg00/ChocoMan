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
        $ChocoVersion = (choco -v -limitoutput --nocolor)
        Return $ChocoVersion
    }
}
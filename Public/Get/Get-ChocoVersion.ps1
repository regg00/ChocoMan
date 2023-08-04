Function Get-ChocoVersion {
    <#
    .SYNOPSIS
        Get the version of chocolatey.
    .DESCRIPTION
        Get the version of chocolatey.
    .EXAMPLE
        Get-ChocoVersion
        2.1.0
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

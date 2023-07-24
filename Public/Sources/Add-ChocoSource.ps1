Function Add-ChocoSource {
    <#
    .SYNOPSIS
        Add a new chocolatey source.
    .DESCRIPTION
        Add a new chocolatey source.
    .EXAMPLE
        Add-ChocoSource
        Name                Uri                                                 UserName
        ----                ---                                                 --------
        chocolatey          https://community.chocolatey.org/api/v2/

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [String] $Name,

        [Parameter(Mandatory = $true)]
        [String] $Uri,

        [String] $UserName,

        [String] $Password
    )

    if (Test-ChocoInstalled) {
        if ($Password -and $UserName) {
            $ChocoSource = choco source add -n $Name -s $Uri -u $UserName -p $Password
        }
        else {
            $ChocoSource = choco source add -n $Name -s $Uri
        }

        $Response = [PSCustomObject]@{
            Name     = $Name
            Uri      = $Uri
            UserName = $UserName
        }

        Return $Response
    }
}

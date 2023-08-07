Function Install-ChocoPackage {
    <#
    .SYNOPSIS
        Installs a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .DESCRIPTION
        Installs a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .PARAMETER Name
        The name of the package to install. You can specify more than one package.

    .PARAMETER Source
        The source to install the package from.

    .PARAMETER Upgrade
        If the package should be upgraded if it already exists.

    .PARAMETER Force
        Will force the reinstallation of the package.

    .PARAMETER AskForConfirmation
        Ask for confirmation before uninstalling the package.

    .EXAMPLE
        Install-ChocoPackage -Name vlc
    .EXAMPLE
        Install-ChocoPackage -Name vlc -Source chocolatey
    .EXAMPLE
        Install-ChocoPackage -Name vlc -Source chocolatey -Upgrade
    .EXAMPLE
        Install-ChocoPackage -Name vlc -WhatIf

    .OUTPUTS
        PSCustomObject
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String[]] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false,
        [Switch] $Force = $false,
        [Switch] $AskForConfirmation

    )

    begin {
        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {

            if ($Upgrade) {
                [String[]]$Arguments = "upgrade"
            }
            else {
                [String[]]$Arguments = "install"
            }

            if ($Force) {
                $Arguments += "--force"
            }

            if (-Not ($AskForConfirmation)) {
                $Arguments += "-y"
            }
        }
    }

    process {

        $Arguments += "--source", $Source

        foreach ($package in $Name) {


            if ($PSCmdlet.ShouldProcess($Name, "Install-ChocoPackage")) {
                $CommandOutput = Invoke-ChocoCommand ($Arguments + $package)
                Return Format-ChocoCommandOutput -OutputObject $CommandOutput -Name $package
            }

            if ($WhatIfPreference) {
                $CommandOutput = Invoke-ChocoCommand ($Arguments + $package + "--whatif")
                Return Format-ChocoCommandOutput -OutputObject $CommandOutput -Name $package

            }



        }
    }

    end {

    }
}

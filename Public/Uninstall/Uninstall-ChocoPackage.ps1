Function Uninstall-ChocoPackage {
    <#
    .SYNOPSIS
        Uninstalls a chocolatey package. Doesn't asks for confirmation by default.

    .DESCRIPTION
        Uninstalls a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to uninstall a package. This function also accepts pipeline input.

    .PARAMETER Name
        The name of the package to uninstall. You can specify more than one package.

    .PARAMETER Force
        Will force the uninstallation of the package.

    .PARAMETER AskForConfirmation
        Ask for confirmation before uninstalling the package.

    .EXAMPLE
        Uninstall-ChocoPackage -Name rufus
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Uninstalled
    .EXAMPLE
        Uninstall-ChocoPackage -Name rufus -Force
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Uninstalled
    .EXAMPLE
        Uninstall-ChocoPackage -Name rufus -AskForConfirmation
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Uninstalled
    .EXAMPLE
        Get-ChocoPackage -Name rufus | Uninstall-ChocoPackage
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Uninstalled

    .EXAMPLE
        Uninstall-ChocoPackage -Name rufus -WhatIf
        What if: Performing the operation "Uninstall-ChocoPackage" on target "rufus".

        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Would be uninstalled

    .OUTPUTS
        PSCustomObject
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String[]] $Name,
        [Switch] $Force,
        [Switch] $AskForConfirmation
    )
    begin {

        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {

            [String[]]$Arguments = "uninstall"

            if ($Force) {
                $Arguments += "--force"
            }

            if (-Not ($AskForConfirmation)) {
                $Arguments += "-y"
            }

        }

    }
    process {

        foreach ($package in $Name) {

            if ($PSCmdlet.ShouldProcess($Name, "Uninstall-ChocoPackage")) {
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

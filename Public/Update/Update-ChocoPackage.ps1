Function Update-ChocoPackage {
    <#
    .SYNOPSIS
        Updates a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .DESCRIPTION
        Updates a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .PARAMETER Name
        The name of the package to upgrade.

    .PARAMETER Force
        Will force the reinstallation of the package.
    .PARAMETER PreRelease
        If set, will include pre-release versions in the upgrade process.
    .PARAMETER AskForConfirmation
        If set, will ask for confirmation before updating the package.

    .EXAMPLE
        Update-ChocoPackage -Name rufus
        Name  Version Status
        ----  ------- ------
        rufus         Unhandled
    .EXAMPLE
        Update-ChocoPackage -Name rufus -WhatIf
        What if: Performing the operation "Install-ChocoPackage" on target "rufus".

        Name  Version Status
        ----  ------- ------
        rufus         Unhandled
    .EXAMPLE
        Update-ChocoPackage -Name rufus -Force
        Name  Version Status
        ----  ------- ------
        rufus         Unhandled

    .OUTPUTS
        PSCustomObject
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String] $Name,
        [String] $Source,
        [Switch] $Force = $false,
        [Switch] $PreRelease = $false,
        [Switch] $AskForConfirmation = $false
    )


    begin {

        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {
            [String[]]$Arguments = "upgrade"

            if ($Source) {
                $Arguments += "-source", $Source
            }

            if ($Force) {
                $Arguments += "--force"
            }

            if (-Not ($AskForConfirmation)) {
                $Arguments += "-y"
            }

            if ($PreRelease) {
                $Arguments += "--pre"
            }

        }

    }
    process {
        $Arguments += $Name

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
    end {    }


}

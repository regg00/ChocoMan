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
        Install-ChocoPackage -Name rufus
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Installed
    .EXAMPLE
        Install-ChocoPackage -Name rufus -Source chocolatey
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Installed
    .EXAMPLE
        Install-ChocoPackage -Name rufus -Source chocolatey -Upgrade
        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Installed
    .EXAMPLE
        Install-ChocoPackage -Name rufus -WhatIf
        What if: Performing the operation "Install-ChocoPackage" on target "rufus".

        Name  Version Status
        ----  ------- ------
        rufus 4.2.0   Chocolatey would have used NuGet to install packages (if they are not already installed)

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

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

    .EXAMPLE
        Update-ChocoPackage -Name vlc
    .EXAMPLE
        Update-ChocoPackage -Name vlc -Force

    .OUTPUTS
        PSCustomObject
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false,
        [Switch] $Force = $false
    )


    begin {

        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {
            [String[]]$Arguments = "upgrade"

            if ($Force) {
                $Arguments += "--force"
            }

            if (-Not ($AskForConfirmation)) {
                $Arguments += "-y"
            }

        }


    }
    process {
        $Arguments += $Name

        foreach ($package in $Name) {

            $CommandOutput = Invoke-ChocoCommand ($Arguments + $package)

            Return Format-ChocoCommandOutput -OutputObject $CommandOutput -Name $package
        }

    }
    end {    }


}
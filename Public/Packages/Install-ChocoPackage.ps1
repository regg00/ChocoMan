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

    .OUTPUTS
        PSCustomObject
    #>
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String[]] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false,
        [Switch] $Force = $false,
        [Switch] $AskForConfirmation

    )

    begin {
        # TODO: Add check for admin rights
        if (-Not (Test-ChocoInstalled)) {
            Write-Error "Chocolatey is not installed. Please install it first."
            return
        }

        if ($Upgrade) {
            [String[]]$Arguments = "upgrade"
        } else {
            [String[]]$Arguments = "install"
        }

        if ($Force) {
            $Arguments += "--force"
        }

        if (-Not ($AskForConfirmation)) {
            $Arguments += "-y"
        }
    }

    process {

        $Arguments += "--source", $Source

        foreach ($package in $Name) {

            $CommandOutput = Invoke-ChocoCommand ($Arguments + $package)

            if ($CommandOutput.Status -eq "Success") {
                if ($CommandOutput.RawOutput -like "*already installed.*") {

                    $Status = "Already installed"

                }
                elseif ($CommandOutput.RawOutput -like "*The install of $package was successful*") {
                    $Status = "Installed"

                }
                $Version = (Get-ChocoPackage $package).Version
            } else {
                $Status = "Error"
            }

            [PSCustomObject]@{
                Name   = $package
                Status = $Status
                Version = $Version
            }
        }
    }

    end {

    }
}

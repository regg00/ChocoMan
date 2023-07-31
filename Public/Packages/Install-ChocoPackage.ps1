Function Install-ChocoPackage {
    <#
    .SYNOPSIS
        Installs a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .DESCRIPTION
        Installs a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .PARAMETER Name
        The name of the package to install.

    .PARAMETER Source
        The source to install the package from.

    .PARAMETER Upgrade
        If the package should be upgraded if it already exists.

    .PARAMETER Force
        Will force the reinstallation of the package.

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
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false,
        [Switch] $Force = $false
    )

    # TODO: Check if the user is admin

    if (Test-ChocoInstalled) {

        if ($Upgrade) {
            [String[]]$Arguments += "upgrade", "-y"
        }
        elseif ($Force) {
            [String[]]$Arguments += "install", "--force", "-y"
        }
        else {
            [String[]]$Arguments += "install", "-y"
        }

        $Arguments += $Name, "--source", $Source

        $CommandOutput = Invoke-ChocoCommand $Arguments
        if ($CommandOutput.Status -eq "Success") {
            if ($CommandOutput.RawOutput -like "*already installed.*") {

                $Status = "Already installed"

            }
            elseif ($CommandOutput.RawOutput -like "*The install of $Name was successful*") {
                $Status = "Installed"

            }
            $Version = (Get-ChocoPackage $Name).Version
        }

        Return [PSCustomObject]@{
            Name    = $Name
            Status  = $Status
            Version = $Version
        }

    }
    else {
        Write-Error "Chocolatey is not installed. Please install it first."
    }
}

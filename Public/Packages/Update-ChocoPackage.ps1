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

        # TODO: Check if the user is admin

        if (-Not (Test-ChocoInstalled)) {
            Write-Error "Chocolatey is not installed. Please install it first."
            return
        }

        [String[]]$Arguments = "upgrade"

        if ($Force) {
            $Arguments += "--force"
        }

        if (-Not ($AskForConfirmation)) {
            $Arguments += "-y"
        }
    }
    process {
        $Arguments += $Name
    }
    end {
        $CommandOutput = Invoke-ChocoCommand $Arguments
        if ($CommandOutput.Status -eq "Error" -and $CommandOutput.RawOutput -like "*Cannot uninstall a non-existent package.*") {
            $Status = "Cannot uninstall a non-existent package"
        }
        elseif ($CommandOutput.Status -eq "Success") {
            if ($CommandOutput.RawOutput -like "*The upgrade of * was successful.*") {
                $Status = "Upgraded"
            }
        }

        Return [PSCustomObject]@{
            Name   = $Name
            Status = $Status
        }

    }


}

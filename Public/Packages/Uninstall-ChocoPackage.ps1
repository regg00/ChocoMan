Function Uninstall-ChocoPackage {
    <#
    .SYNOPSIS
        Uninstalls a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to uninstall a package.

    .DESCRIPTION
        Uninstalls a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to uninstall a package.

    .PARAMETER Name
        The name of the package to uninstall.

    .PARAMETER Force
        Will force the uninstallation of the package.

    .PARAMETER AskForConfirmation
        Ask for confirmation before uninstalling the package.

    .EXAMPLE
        Uninstall-ChocoPackage -Name vlc

    .OUTPUTS
        String
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        $Name,
        [Switch] $Force,
        [Switch] $AskForConfirmation
    )
    begin {
        if (-Not (Test-ChocoInstalled)) {
            Write-Error "Chocolatey is not installed. Please install it first."
            return
        }

        [Array]$Arguments = "uninstall"

        if ($Force) {
            $Arguments += "--force"
        }

        if (-Not ($AskForConfirmation)) {
            $Arguments += "-y"
        }

    }
    process {

        if ($Name -is [System.Management.Automation.PSCustomObject]) {
            $Arguments += $Name.Name
        }
        else {
            $Arguments += $Name
        }

    }
    end {
        Write-Host "choco $Arguments" -ForegroundColor green
        Invoke-ChocoCmd $Arguments
    }

}

Function Uninstall-ChocoPackage {
    <#
    .SYNOPSIS
        Uninstalls a chocolatey package. Doesn't asks for confirmation by default.

    .DESCRIPTION
        Uninstalls a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to uninstall a package. This function also accepts pipeline input.

    .PARAMETER Name
        The name of the package to uninstall.

    .PARAMETER Force
        Will force the uninstallation of the package.

    .PARAMETER AskForConfirmation
        Ask for confirmation before uninstalling the package.

    .EXAMPLE
        Uninstall-ChocoPackage -Name vlc
    .EXAMPLE
        Uninstall-ChocoPackage -Name vlc -Force
    .EXAMPLE
        Uninstall-ChocoPackage -Name vlc -AskForConfirmation
    .EXAMPLE
        Get-ChocoPackage -Name vlc | Uninstall-ChocoPackage

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

        [String[]]$Arguments = "uninstall"

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
        Invoke-ChocoCmd $Arguments
    }

}

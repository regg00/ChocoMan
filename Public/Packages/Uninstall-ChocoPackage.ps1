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
        $Name

    )

    begin {

    }

    process {
        if (Test-ChocoInstalled) {
            [Array]$Arguments = "uninstall"

            if ($Name -is [System.Management.Automation.PSCustomObject]) {
                $Arguments += $Name.Name
            }


            if ($Force) {
                $Arguments += "--force"
            }
            $Arguments += $Name

            if ($AskForConfirmation) {
                Invoke-ChocoCmd $Arguments

            }
            else {
                Invoke-ChocoCmd $Arguments
            }

        }
        else {
            Write-Error "Chocolatey is not installed. Please install it first."
        }
    }

    end {}
}

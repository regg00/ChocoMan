Function Format-ChocoCommandOutput {
    <#
    .SYNOPSIS
        Format the output of chocolatey commands to get the status of an action for a specific package or source.
    .DESCRIPTION
        Format the output of chocolatey commands to get the status of an action for a specific package or source.
    .EXAMPLE
        Format-ChocoCommandOutput -OutputObject $CommandOutput -Name rufus
        Name  Status    Version
        ----  ------    -------
        rufus Installed v4.2.0
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [PSCustomObject] $OutputObject,
        [String] $Name,
        [String] $Source
    )
    begin {
        $Status = $OutputObject.Status
        $Output = $OutputObject.RawOutput
    }
    process {

        try {
            $Version = ($CommandOutput.RawOutput | Select-String 'v\d.\d.\d').matches[0].value
        }
        catch {
            $Version = $null
        }



        # If the package was already installed
        if ($Output -match "^ - $Name - $Name $Version already installed.$") {
            $Status = "Already installed"
        }

        # If the installation was successfull
        elseif ($Output -match "^ The install of $Name was successful.$") {
            $Status = "Installed"
        }

        # Uninstallation was successfull
        elseif ($Output -match "^ $Name has been successfully uninstalled.$") {
            $Status = "Uninstalled"
        }

        # Tried to uninstalled a non-existent package
        elseif ($Output -match "^ - $Name - $Name is not installed. Cannot uninstall a non-existent package.$") {
            $Status = "Non-existent package"
        }

        # Upgrade successfull
        elseif ($Output -match "^ The upgrade of $Name was successful.$") {
            $Status = "Non-existent package"
        }

        # Package already up-to-date
        elseif ($Output -match "^Chocolatey upgraded 0/1 packages.$") {
            $Status = "Non-existent package"
        }


        else {
            $Status = "Unhandled"
        }



        [PSCustomObject]@{
            Name    = $Name
            Status  = $Status
            Version = $Version
        }



    }
    end {}
}
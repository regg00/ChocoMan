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
            $Version = (($CommandOutput.RawOutput | Select-String 'v\d+.\d+.\d+').matches[0].value).Substring(1)
        }
        catch {
            $Version = $null
        }

        Write-Verbose (Out-String -InputObject $Output)


        # If the package was already installed
        if ($Output -match "^ - $Name - $Name v$Version already installed.$") {
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
            $Status = "Upgraded"
        }

        # Package already up-to-date
        elseif ($Output -match "^Chocolatey upgraded 0/1 packages.$") {
            $Status = "Non-existent package"
        }

        # Whatif on installed package
        elseif ($Output -match "^Chocolatey would have used NuGet to install packages \(if they are not already installed\):$") {
            $Status = "Chocolatey would have used NuGet to install packages (if they are not already installed)"
        }

        # Whatif uninstalling an installed package
        elseif ($Output -match "^Would have uninstalled $Name") {
            $Status = "Would be uninstalled"
        }




        else {
            $Status = "Unhandled"
        }



        [PSCustomObject]@{
            Name    = $Name
            Version = $Version
            Status  = $Status
        }

    }
    end {}
}
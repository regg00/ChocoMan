Function Remove-ChocoSource {
    <#
    .SYNOPSIS
        Removes a chocolatey source.
    .DESCRIPTION
        Removes a chocolatey source.
    .PARAMETER Name
        The name of the source.

    .EXAMPLE
        Remove-ChocoSource -Name test
        Name Status
        ---- ------
        test Removed

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [String] $Name

    )
    begin {
        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {

            [String[]]$Arguments = "source", "remove", "-n=$Name"

        }
    }
    process {
        try {

            if ($PSCmdlet.ShouldProcess($Name, "Remove-ChocoSource")) {

                if ((Get-ChocoSource -Name test).Name) {
                    $CommandOutput = Invoke-ChocoCommand $Arguments

                    if ($CommandOutput.RawOutput -like "Removed $Name") {
                        Return [PSCustomObject]@{
                            Name   = $Name
                            Status = "Removed"
                        }
                    }
                    else {
                        Return [PSCustomObject]@{
                            Name   = $Name
                            Status = "Something went wrong"
                        }
                    }
                }

                else {
                    Return [PSCustomObject]@{
                        Name   = $Name
                        Status = "Source does not exist"
                    }
                }


            }

            if ($WhatIfPreference) {
                $CommandOutput = Invoke-ChocoCommand ($Arguments + "--whatif")

                if ($CommandOutput.RawOutput -like "Would have made a change to the configuration.") {
                    $Status = "Source would have been removed"
                }

                Return [PSCustomObject]@{
                    Name   = $Name
                    Status = $Status
                }
            }

        }
        catch {
            Write-Error "Cannot remove source. Error: $_"
        }

    }
    end {

    }
}

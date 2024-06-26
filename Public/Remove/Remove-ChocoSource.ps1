Function Remove-ChocoSource {
    <#
    .SYNOPSIS
        Removes a chocolatey source.
    .DESCRIPTION
        Removes a chocolatey source.
    .PARAMETER Source
        The name or uri of the source to remove.
    .EXAMPLE
        Remove-ChocoSource -Source test
        Name Status
        ---- ------
        test Removed
   .EXAMPLE
        Remove-ChocoSource -Source https://chocolatey.org/api/v2
        Name Status
        ---- ------
        test Removed

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Source
    )
    begin {

        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {

            if($Source -like "http*") {
                $Server = $Source
            } else {
                $Name = $Source
            }

            [String[]]$Arguments = "source", "remove"

            if($Name) {
                $target = $Name
                $targetType = "Name"
            } else {
                $target = $Server
                $targetType = "Server"
            }
        }
    }
    process {
        try {

            if ($PSCmdlet.ShouldProcess($target, "Remove-ChocoSource")) {

                # Determine the target for removal based on provided parameters
                if ($Name) {
                    $Server = (Get-ChocoSource | Where-Object Name -eq $Name).Name
                } elseif ($Server) {
                    $Name = (Get-ChocoSource | Where-Object Uri -eq $Server).Name
                }

                if ($Name -and $Server) {
                    $Arguments += "-n=$Name"
                    $Arguments += "-s=$Server"

                    $CommandOutput = Invoke-ChocoCommand $Arguments

                    if ($CommandOutput.RawOutput -like "Removed $Name") {
                        Return [PSCustomObject]@{
                            Target = $Target
                            TargetType = $targetType
                            Status = "Removed"
                        }
                    } 
                    else {
                        Return [PSCustomObject]@{
                            Target   = $Target
                            TargetType = $targetType
                            Status = "Something went wrong"
                        }
                    }
                } 
                
                else {
                    Return [PSCustomObject]@{
                        Target = $target
                        TargetType = $targetType
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

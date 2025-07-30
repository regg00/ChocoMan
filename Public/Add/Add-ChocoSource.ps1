Function Add-ChocoSource {
    <#
    .SYNOPSIS
        Add a new chocolatey source.
    .DESCRIPTION
        Add a new chocolatey source.
    .PARAMETER Name
        The name of the source.
    .PARAMETER Uri
        The Uri of the source.
    .PARAMETER Credential
        The credential to use to access the source.
    .PARAMETER Priority
        The priority of the source.
    .EXAMPLE
        Add-ChocoSource -Name test -Url https://test.com -Priority 10        

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [String] $Name,

        [Parameter(Mandatory = $true)]
        [String] $Uri,
        
        [Parameter(Mandatory = $false)]
        [Int16] $Priority = 0,

        [PSCredential] $Credential
    )
    begin {
        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {

            [String[]]$Arguments = "source", "add", "-s=""$Uri""", "-n=$Name", "--priority=$Priority"

            if ($Credential) {
                $Arguments += "-u=$($Credential.GetNetworkCredential().UserName)"
                $Arguments += "-p=$($Credential.GetNetworkCredential().Password)"
            }
        }
    }
    process {
        try {

            if ($PSCmdlet.ShouldProcess($Name, "Add-ChocoSource")) {

                $CommandOutput = Invoke-ChocoCommand $Arguments





                if ($CommandOutput.RawOutput -like "Added*") {
                    $Status = "Added"
                }
                elseif ($CommandOutput.RawOutput -like "Updated*") {
                    $Status = "Updated"
                }
                elseif ($CommandOutput.RawOutput -like "Nothing to change*") {
                    $Status = "Nothing to change"
                }

                Return [PSCustomObject]@{
                    Name   = $Name
                    Uri    = $Uri
                    Status = $Status
                }
            }

            if ($WhatIfPreference) {
                $CommandOutput = Invoke-ChocoCommand ($Arguments + "--whatif")

                if ($CommandOutput.RawOutput -like "Would have made a change to the configuration.") {
                    $Status = "Would have made a change to the configuration."
                }

                Return [PSCustomObject]@{
                    Name   = $Name
                    Uri    = $Uri
                    Status = $Status
                }
            }

        }
        catch {
            Write-Error "Cannot add source. Error: $_"
        }

    }
    end {

    }
}

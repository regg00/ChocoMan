Function New-ChocoPackage {
    <#
    .SYNOPSIS
        Create a new empty package.
    .DESCRIPTION
        Create a new empty package.
    .PARAMETER Name
        The name of the package to create.
    .PARAMETER OutputDir
        The local path where the package files will be created. Defaults to current directory.
    .PARAMETER Version
        The version of the package to create. Defaults to 1.0.0.
    .EXAMPLE
        New-ChocoPackage -Name test        
    .EXAMPLE
        New-ChocoPackage -Name test -OutputDir C:\test -Version 2.0.0       
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [String] $Name,

        [Parameter(Mandatory = $false)]
        [String] $OutputDir = "$PWD",               

        [Parameter(Mandatory = $false)]
        [String] $Version = '1.0.0'

        
    )
    begin {
        if (Test-ChocoInstalled) {

            [String[]]$Arguments = "new", "-n=$Name", "--version=$Version", "--out=""$OutputDir"""
            
        }
    }
    process {
        try {

            if ($PSCmdlet.ShouldProcess($Name, "New-ChocoPackage")) {

                $CommandOutput = Invoke-ChocoCommand $Arguments

                if ($CommandOutput.RawOutput -like "Successfully generated*") {
                    $Status = "Created"
                }
                elseif ($CommandOutput.RawOutput -like "The location for the template already exists.*") {
                    $Status = "Directory already exists."
                }                

                Return [PSCustomObject]@{
                    Name   = $Name
                    OutputDir = Join-Path -Path $OutputDir -ChildPath $Name
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
                    OutputDir = Join-Path -Path $OutputDir -ChildPath $Name
                    Status = $Status
                }
            }

        }
        catch {
            Write-Error "Cannot create package. Error: $_"
        }

    }
    end {

    }
}

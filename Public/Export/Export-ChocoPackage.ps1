Function Export-ChocoPackage {
    <#
    .SYNOPSIS
        Bundles a Chocolatey package in a .nupkg file for publishing.
    .DESCRIPTION
        Bundles a Chocolatey package in a .nupkg file for publishing.
    .PARAMETER Path
        The path of the nuspec file.
    .PARAMETER OutputDir
        The local path where the package files will be created. Defaults to current directory.    
    .EXAMPLE
        Export-ChocoPackage -Path C:\test\testing.nuspec        
    .EXAMPLE
        Export-ChocoPackage -Path C:\test\testing.nuspec -OutputDir C:\output
    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [String] $Path,

        [Parameter(Mandatory = $false)]
        [String] $OutputDir = "$PWD"
        
    )
    begin {
        if (Test-ChocoInstalled) {
        
            $AbsolutePath = (Resolve-Path $Path).Path

            [String[]]$Arguments = "pack", "$AbsolutePath", "--out=""$OutputDir"""
            
        }
    }
    process {
        try {

            if ($PSCmdlet.ShouldProcess($Path, "Export-ChocoPackage")) {

                $CommandOutput = Invoke-ChocoCommand $Arguments                                                         

                if ($CommandOutput.RawOutput -like "Successfully created package*") {
                    $matchInfo = $CommandOutput.RawOutput | Select-String -Pattern "Successfully created package '(.*)'"
                    Write-Host $matchInfo
                    $path = $matchInfo.Matches.Groups[1].Value
                    $Status = "Created"
                    $OutputDir = $Path
                }
                
                elseif ($CommandOutput.RawOutput -like "One or mode issues found with*") {
                    $Status = "Some issue found within the nuspec file. Please fix."
                }    
                elseif ($CommandOutput.RawOutput -like "No .nuspec files (or more than 1) were found to build*") {
                    $Status = "No .nuspec files (or more than 1) were found to build."
                }   
                elseif ($CommandOutput.RawOutput -like "File specified is either not found or not a .nuspec file*") {
                    $Status = "File specified is either not found or not a .nuspec file."
                }              

                Return [PSCustomObject]@{                    
                    OutputDir = $OutputDir
                    Status = $Status
                }
            }

            if ($WhatIfPreference) {
                $CommandOutput = Invoke-ChocoCommand ($Arguments + "--whatif")

                if ($CommandOutput.RawOutput -like "Chocolatey would have searched for a nuspec file in *") {
                    $Status = $CommandOutput.RawOutput
                }

                Return [PSCustomObject]@{                    
                    OutputDir = $OutputDir
                    Status = $Status
                }
            }

        }
        catch {
            Write-Error "Cannot export package. Error: $_"
        }

    }
    end {

    }
}

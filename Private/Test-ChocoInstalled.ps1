Function Test-ChocoInstalled {
    <#
    .SYNOPSIS
        Check that chocolatey is installed.
    .DESCRIPTION
        Check that chocolatey is installed.
    .OUTPUTS
        Boolean
    #>
    [CmdletBinding()]
    [OutputType([Boolean])]
    param()
    
    $CheckPath = if ($env:ChocolateyInstall) { $env:ChocolateyInstall } else { "$env:PROGRAMDATA\chocolatey" }
    $Command = Get-Command choco.exe -ErrorAction Ignore

    if ($Command.Path -and (Test-Path -Path $Command.Path)) {
        # choco is in the %PATH% environment variable, assume it's installed  
        Write-Verbose "Chocolatey is installed."      
        Return $true
    }
    elseif (-not (Test-Path $CheckPath)) {
        # Install folder doesn't exist
        Write-Verbose "Chocolatey is not installed."
        Return $false
    }
    elseif (-not (Get-ChildItem -Path $CheckPath)) {
        # Install folder exists but is empty
        Write-Verbose "Chocolatey is not installed."
        Return $false
    }
    else {
        # Install folder exists and is not empty    
        Write-Verbose "Chocolatey is installed."    
        Return $true
    }
}
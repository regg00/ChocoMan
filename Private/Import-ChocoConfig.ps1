Function Import-ChocoConfig {
    <#
    .SYNOPSIS
        Retrieves the Chocolatey configuration
    .DESCRIPTION    
        Retrieves the Chocolatey configuration     

    .EXAMPLE
        Import-ChocoConfig 
        xml                            chocolatey
        ---                            ----------
        version="1.0" encoding="utf-8" chocolatey          

    .OUTPUTS
        XML
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(             
    )

    if (Test-ChocoInstalled) {  
        try {
            $ConfigPath = Join-Path $env:ChocolateyInstall 'config\chocolatey.config'
            $Config = [xml]::new()
            $Config.Load($ConfigPath)            

            Return $Config
        
        }
        catch {
            Write-Error -Message "Failed to import Chocolatey configuration: $_"
            Return [xml]::new()
        }
        
    }
}
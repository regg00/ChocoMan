Function Invoke-ChocoCmd {
    <#
    .SYNOPSIS
        Invokes a Chocolatey command
    .DESCRIPTION    
        Invokes a Chocolatey command

    .EXAMPLE
                

    .OUTPUTS
        Array
    #>
    [CmdletBinding()]
    [OutputType([array])]
    param( 
        [array] $Arguments            
    )

    if (Test-ChocoInstalled) {  
        
        $Arguments += "-r"
        $Arguments += "--no-color"
            
        $ChocoCommand = @(Get-Command 'choco.exe' -CommandType 'Application' -ErrorAction 'SilentlyContinue')[0]        
        Write-Verbose "choco $($Arguments -join ' ')"
        $Output = (&$ChocoCommand $Arguments)
        Return $Output                        
    }
}
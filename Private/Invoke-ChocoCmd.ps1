Function Invoke-ChocoCmd {
    <#
    .SYNOPSIS
        Invokes a Chocolatey command
    .DESCRIPTION
        Invokes a Chocolatey command

    .EXAMPLE
        Invoke-ChocoCmd -Verbose -Arguments "list", "--no-progress"

    .OUTPUTS
        Array
    #>
    [CmdletBinding()]
    [OutputType([array])]
    param(
        [String[]] $Arguments
    )

    if (Test-ChocoInstalled) {

        $Arguments += "-r"
        $Arguments += "--no-color"

        $ChocoCommand = @(Get-Command 'choco.exe' -CommandType 'Application' -ErrorAction 'SilentlyContinue')[0]
        Write-Verbose "Command to execute: choco $($Arguments -join ' ')"
        $Output = (&$ChocoCommand $Arguments)
        Return $Output
    }
}

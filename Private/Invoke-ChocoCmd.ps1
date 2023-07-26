Function Invoke-ChocoCmd {
    <#
    .SYNOPSIS
        Invokes a Chocolatey command
    .DESCRIPTION
        Invokes a Chocolatey command

    .EXAMPLE
        Invoke-ChocoCmd -Verbose -Arguments "list", "--no-progress"

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String[]] $Arguments
    )

    if (Test-ChocoInstalled) {

        $Arguments += "-r"
        $Arguments += "--no-color"

        $ChocoCommand = @(Get-Command 'choco.exe' -CommandType 'Application' -ErrorAction 'SilentlyContinue')[0]
        Write-Verbose "Command to execute: choco $($Arguments -join ' ')"
        $Output = (&$ChocoCommand $Arguments)

        if ($LASTEXITCODE -eq 1 -or $LASTEXITCODE -eq -1) {
            $Status = "Error"
        }
        else {
            $Status = "Success"
        }

        Return [PSCustomObject]@{
            RawOutput = $Output
            Status    = $Status
        }
    }
}

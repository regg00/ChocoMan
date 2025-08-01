Function Invoke-ChocoCommand {
    <#
    .SYNOPSIS
        Invokes a Chocolatey command
    .DESCRIPTION
        Invokes a Chocolatey command

    .EXAMPLE
        Invoke-ChocoCommand -Verbose -Arguments "list", "--no-progress"

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [String[]] $Arguments,
        [Switch] $BypassDefaultArgs
    )

    if (Test-ChocoInstalled) {

        if (-Not $BypassDefaultArgs) {
            $Arguments += "-r"
            $Arguments += "--no-color"
        }

        Write-Verbose "Command to execute: choco $($Arguments -join ' ')"

        $Job = Start-Job { choco $args } -ArgumentList $Arguments
        $ProgressActivity = "Running choco $Arguments"

        Write-Progress -Id $Job.Id -Activity $ProgressActivity -Status "Starting job..." -PercentComplete -1

        while ($Job.State -eq "Running") {
            # Suppress activity indicator if PowerShell ProgressPreference is set to SilentlyContinue
            If($ProgressPreference -ne "SilentlyContinue") {
                Write-Progress -Id $Job.Id -Activity $ProgressActivity -Status "Running..." -PercentComplete -1
                Wait-Job -Id $Job.Id -Timeout 1
            }
        }
        Write-Progress -Completed -Activity $ProgressActivity
        Write-Host -NoNewLine "`r"


        $Output = Receive-Job $Job

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

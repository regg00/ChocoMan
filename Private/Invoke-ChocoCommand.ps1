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

        $Symbols = @("⣾⣿", "⣽⣿", "⣻⣿", "⢿⣿", "⡿⣿", "⣟⣿", "⣯⣿", "⣷⣿",
            "⣿⣾", "⣿⣽", "⣿⣻", "⣿⢿", "⣿⡿", "⣿⣟", "⣿⣯", "⣿⣷")

        $i = 0;
        while ($Job.State -eq "Running") {
            # Suppress activity indicator if PowerShell ProgressPreference is set to SilentlyContinue
            If($ProgressPreference -ne "SilentlyContinue") {
                $symbol = $symbols[$i]
                Write-Host -NoNewLine "`r$symbol $Label" -ForegroundColor Green
                Start-Sleep -Milliseconds 100
                $i++
                if ($i -eq $symbols.Count) {
                    $i = 0;
                }   
        }
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

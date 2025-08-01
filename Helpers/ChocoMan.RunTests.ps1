#Requires -RunAsAdministrator

$config = New-PesterConfiguration
$config.TestResult.Enabled = $true
$config.Run.Path = ".\Tests\"
$config.Output.Verbosity = "Detailed"

Invoke-Pester -Configuration $config

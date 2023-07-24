$RootPath = Split-Path $PSScriptRoot -Parent

Invoke-ScriptAnalyzer -Recurse (Join-Path $RootPath "Private")
Invoke-ScriptAnalyzer -Recurse (Join-Path $RootPath "Public")
Invoke-ScriptAnalyzer -Recurse (Join-Path $RootPath "Helpers")
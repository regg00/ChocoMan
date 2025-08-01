# Parameters
$manifestPath = ".\ChocoMan.psd1"  # Path to your module manifest
$readmeUrl = "https://raw.githubusercontent.com/regg00/ChocoMan/refs/heads/main/README.md"
$iconUrl = 'https://raw.githubusercontent.com/regg00/ChocoMan/main/Docs/icon.png'


# Get README content from GitHub
try {
    $readmeText = Invoke-RestMethod -Uri $readmeUrl -ErrorAction Stop
} catch {
    Write-Error "Failed to download README: $_"
    return
}

# Truncate to max 4000 characters (PowerShell Gallery limit)
$maxLength = 4000
if ($readmeText.Length -gt $maxLength) {
    $readmeText = $readmeText.Substring(0, $maxLength)
}

# Update the manifest
Update-ModuleManifest -Path $manifestPath `
    -Description $readmeText `
    -IconUri $iconUrl -ModuleVersion '1.3.6'

Write-Host "Module manifest updated successfully."

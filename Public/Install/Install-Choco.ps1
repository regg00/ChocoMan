Function Install-Choco {
    <#
    .SYNOPSIS
        Install chocolatey.
    .DESCRIPTION    
        Install chocolatey.    
    .PARAMETER InstallerUrl
        The url to the chocolatey installer.
    .EXAMPLE
        Install-Choco
        Chocolatey is already installed.
    .EXAMPLE
        Install-Choco -InstallerUrl 'https://chocolatey.org/install.ps1'
        WARNING: 'choco' was found at 'C:\ProgramData\chocolatey\bin\choco.exe'.
        WARNING: An existing Chocolatey installation was detected. Installation will not continue.
        For security reasons, this script will not overwrite existing installations.

        Please use choco upgrade chocolatey to handle upgrades of Chocolatey itself.
        If the existing installation is not functional or a prior installation did not complete, follow these steps:
        - Backup the files at the path listed above so you can restore your previous installation if needed
        - Remove the existing installation manually
        - Rerun this installation script
        - Reinstall any packages previously installed, if needed (refer to the lib folder in the backup)

        Once installation is completed, the backup folder is no longer needed and can be deleted.
        Chocolatey has been installed.
    .OUTPUTS
        String
    #>
    [CmdletBinding()]
    [OutputType([String])]
    param(
        [String] $InstallerUrl = 'https://chocolatey.org/install.ps1'
    )

    if (!(Test-ChocoInstalled)) {        
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($InstallerUrl))        
        return "Chocolatey has been installed."
    }
    else {
        $ChocoVersion = Get-ChocoVersion
        return "Chocolatey is already installed. Version $ChocoVersion"
    }
}
Function Install-ChocoPackage {
    <#
    .SYNOPSIS
        Installs a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.
    .DESCRIPTION    
        Installs a chocolatey package. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.
    .PARAMETER Name
        The name of the package to install.
    .PARAMETER Source
        The source to install the package from.
    .PARAMETER Upgrade
        If the package should be upgraded if it already exists.    
    .PARAMETER Force
        Will force the reinstallation of the package.
    .PARAMETER
        Ask for confirmation before installing the package.
    .EXAMPLE
        Install-ChocoPackage -Name vlc
    .EXAMPLE
        Install-ChocoPackage -Name vlc -Source chocolatey
    .EXAMPLE
        Install-ChocoPackage -Name vlc -Source chocolatey -Upgrade

    .OUTPUTS
        String
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([String])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false,
        [Switch] $Force = $false,
        [Switch] $AskForConfirmation = $false
    )

    if (Test-ChocoInstalled) {
        $Command = "install"
        if ($Upgrade) {
            $Command = "upgrade"
        }
        elseif ($Force) {
            $Command = "install --force"
        }
        
        if ($AskForConfirmation) {
            choco $Command $Name --source $Source
            Write-Verbose "choco $Command $Name --source $Source"
            
        }
        else {
            choco $Command $Name -y --source $Source            
            Write-Verbose "choco $Command $Name -y --source $Source"
        }
        
                       
    }
    else {
        Write-Error "Chocolatey is not installed. Please install it first."
    }
}
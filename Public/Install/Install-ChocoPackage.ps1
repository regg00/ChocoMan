Function Install-ChocoPackage {
    <#
    .SYNOPSIS
        Installs a chocolatey package.        
    .DESCRIPTION    
        Installs a chocolatey package with the option to upgrade it. By default, no confirmation is asked.
    .PARAMETER Name
        The name of the package to install.
    .PARAMETER Source
        The source to install the package from.
    .PARAMETER Upgrade
        If the package should be upgraded if it already exists.
    .PARAMETER Confirm
        If the package should be installed with confirmation.
    .EXAMPLE
        Install-ChocoPackage -Name vlc
        

    .OUTPUTS
        String
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([String])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false
    )

    if (Test-ChocoInstalled) {
        if ($Upgrade) {
            $Command = "upgrade"
        }
        else {
            $Command = "install"
        }
        if ($PSCmdlet.ShouldProcess($Name)) {
            choco $Command $Name --source $Source
        }
        else {
            choco $Command -y $Name --source $Source
        }                
    }
    else {
        Write-Error "Chocolatey is not installed. Please install it first."
    }
}
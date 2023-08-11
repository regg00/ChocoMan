Function Get-ChocoManVersion {
    <#
    .SYNOPSIS
        Get the version of ChocoMan.
    .DESCRIPTION
        Get the version of ChocoMan.
    .EXAMPLE
        Get-ChocoManVersion
        2.1.0
    .OUTPUTS
        String
    #>
    [CmdletBinding()]
    [OutputType([String])]
    param()

    Write-Host "

    █▀▀ █░█ █▀█ █▀▀ █▀█ █▀▄▀█ ▄▀█ █▄░█
    █▄▄ █▀█ █▄█ █▄▄ █▄█ █░▀░█ █▀█ █░▀█

    ▄▀█   █▀▀ █░█ █▀█ █▀▀ █▀█ █░░ ▄▀█ ▀█▀ █▀▀ █▄█   █▀█ █▀█ █░█░█ █▀▀ █▀█ █▀ █░█ █▀▀ █░░ █░░   █░█░█ █▀█ ▄▀█ █▀█ █▀█ █▀▀ █▀█
    █▀█   █▄▄ █▀█ █▄█ █▄▄ █▄█ █▄▄ █▀█ ░█░ ██▄ ░█░   █▀▀ █▄█ ▀▄▀▄▀ ██▄ █▀▄ ▄█ █▀█ ██▄ █▄▄ █▄▄   ▀▄▀▄▀ █▀▄ █▀█ █▀▀ █▀▀ ██▄ █▀▄
    "
    Write-Host "ChocoMan v$((Get-Module -Name ChocoMan).Version)"
}

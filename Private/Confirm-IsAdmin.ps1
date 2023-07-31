Function Confirm-IsAdmin {
    <#
    .SYNOPSIS
        Check that the current user is an administrator.
    .DESCRIPTION
        Check that the current user is an administrator.
    .EXAMPLE
        Confirm-IsAdmin
        True
    .OUTPUTS
        Boolean
    #>
    [CmdletBinding()]
    [OutputType([Boolean])]
    param()
    begin {}
    process {
        Return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
    }
    end {}
}
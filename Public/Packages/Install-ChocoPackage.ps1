Function Install-ChocoPackage {
    <#
    .SYNOPSIS
        Installs a single or multiple chocolatey packages. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .DESCRIPTION
        Installs a single or multiple chocolatey packages. Doesn't asks for confirmation by default. Just like Chocolatey, you may need admin rights to install a package.

    .PARAMETER Name
        The name of the package to install.

    .PARAMETER Source
        The source to install the package from.

    .PARAMETER Upgrade
        If the package should be upgraded if it already exists.

    .PARAMETER Force
        Will force the reinstallation of the package.

    .EXAMPLE
        Install-ChocoPackage -Name rufus
        Name  Status
        ----  ------
        rufus Installed

    .EXAMPLE
        Install-ChocoPackage -Name rufus, azcopy10
        Name     Status
        ----     ------
        azcopy10 Already installed
        rufus    Already installed

    .EXAMPLE
        Install-ChocoPackage -Name rufus -Source chocolatey
    .EXAMPLE
        Install-ChocoPackage -Name rufus -Source chocolatey -Upgrade

    .OUTPUTS
        PSCustomObject
    #>
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        $Name,
        [String] $Source = "chocolatey",
        [Switch] $Upgrade = $false,
        [Switch] $Force = $false
    )
    begin {

        if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {
            if ($Upgrade) {
                [String[]]$Arguments += "upgrade", "-y"
            }
            elseif ($Force) {
                [String[]]$Arguments += "install", "--force", "-y"
            }
            else {
                [String[]]$Arguments += "install", "-y"
            }
        }

        $Arguments += "--source", $Source
        $Packages = @()
    }
    process {

        if ( $Name -is [System.Array] ) {
            foreach ($n in $Name) {
                $Arguments += $n
            }

        }
        else {
            $Arguments += $Name
            $Packages += $Name
        }


    }
    end {
        $CommandOutput = Invoke-ChocoCommand $Arguments

        $Response = @()

        if ($CommandOutput.Status -eq "Success") {
            if ( $Name -is [System.Array] ) {
                foreach ($n in $Name) {
                    if ($CommandOutput.RawOutput -like "*$n *already installed.*") {

                        $Response += [PSCustomObject]@{
                            Name   = $n
                            Status = "Already installed"
                        }

                    }
                    elseif ($CommandOutput.RawOutput -like "*The install of $n was successful*") {
                        $Response += [PSCustomObject]@{
                            Name   = $n
                            Status = "Installed"
                        }
                    }
                }
            }
            else {
                Foreach ( $Package in $Packages ) {


                    if ($CommandOutput.RawOutput -like "*$Package *already installed.*") {

                        $Response += [PSCustomObject]@{
                            Name   = $Package
                            Status = "Already installed"
                        }

                    }
                    elseif ($CommandOutput.RawOutput -like "*The install of $Package was successful*") {
                        $Response += [PSCustomObject]@{
                            Name   = $Package
                            Status = "Installed"
                        }
                    }
                }


            }


        }

        Return $Response

    }







}

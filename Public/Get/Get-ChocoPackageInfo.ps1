<#
.SYNOPSIS
    Retrieves information about a Chocolatey package.

.DESCRIPTION
    The Get-ChocoPackageInfo function uses the Chocolatey 'choco info' command to retrieve detailed information about a specified package. 
    It returns a custom object with properties for each piece of information.

.PARAMETER PackageName
    The name of the Chocolatey package to retrieve information for. This parameter accepts pipeline input.

.EXAMPLE
    Get-ChocoPackageInfo -PackageName 'git'

    This command retrieves information about the 'git' package.

.EXAMPLE
    'git', 'python' | Get-ChocoPackageInfo

    This command retrieves information about the 'git' and 'python' packages.

.OUTPUTS
    PSCustomObject. The object has properties for each piece of information about the package.
#>
function Get-ChocoPackageInfo {
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$PackageName
    )

    process {
        # Run the choco info command
        $ChocoCommandOutput = Invoke-ChocoCommand -Arguments "info $PackageName" -ErrorAction SilentlyContinue

        # Define regular expressions to match the required fields
        $patterns = @{
            'Title'                   = 'Title: (.*) \| Published: (.*)'
            'PackageApproved'         = 'Package approved as a trusted package on (.*)\.'
            'PackageTestStatus'       = 'Package testing status: (.*)\.'
            'DownloadsTotal'          = 'Number of Downloads: (\d+) \| Downloads for this version: (\d+)'
            'PackageURL'              = 'Package url (.*)'
            'ChocolateyPackageSource' = 'Chocolatey Package Source: (.*)'
            'PackageChecksum'         = "Package Checksum: '(.*)' \((.*)\)"
            'Tags'                    = 'Tags: (.*)'
            'SoftwareSite'            = 'Software Site: (.*)'
            'SoftwareLicense'         = 'Software License: (.*)'
            'Documentation'           = 'Documentation: (.*)'
            'MailingList'             = 'Mailing List: (.*)'
            'Issues'                  = 'Issues: (.*)'
            'Summary'                 = 'Summary: (.*)'
        }

        # Create a hashtable to store the results
        $result = @{
            'id' = $PackageName
        }

        # Iterate through the patterns and match against the choco info output
        $inDescription = $false
        $descriptionLines = @()
        foreach ($line in $ChocoCommandOutput) {
            if ($inDescription) {
                $descriptionLines += $line
                continue
            }

            foreach ($key in $patterns.Keys) {
                if ($line -match $patterns[$key]) {
                    $matches = $matches[1..($matches.Count - 1)] # Exclude the full match
                    switch ($key) {
                        'Title' {
                            $result['Title'] = $matches[0]
                            $result['Published Date'] = $matches[1]
                        }
                        'DownloadsTotal' {
                            $result['DownloadsTotal'] = $matches[0]
                            $result['Downloads'] = $matches[1]
                        }
                        'PackageChecksum' {
                            $result['PackageChecksum'] = $matches[0]
                            $result['PackageChecksumFormat'] = $matches[1]
                        }
                        'Tags' {
                            $result['Tags'] = $matches[0].Split(' ')
                        }
                        default {
                            $result[$key] = $matches[0]
                        }
                    }
                }
            }

            if ($line -match 'Description: (.*)') {
                $inDescription = $true
                $descriptionLines += $matches[1]
            }
        }

        # Combine the description lines into one string
        $result['Description'] = $descriptionLines -join "`n"

        # Create a custom object from the result
        $customObject = New-Object PSObject -property $result

        # Return the custom object
        return $customObject
    }
}
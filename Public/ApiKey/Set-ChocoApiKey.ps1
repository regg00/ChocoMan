Function Set-ChocoApiKey {
    <#
    .SYNOPSIS
        Sets an api key for a particular source so it doesn't need to be specified every time.
    .DESCRIPTION
        Sets an api key for a particular source so it doesn't need to be specified every time.
    .PARAMETER Source
        The source to retrieve, save or delete the API key for

    .EXAMPLE
        Set-ChocoApiKey -Source https://chocolatey.org -ApiKey 1234
        Source             Status          ApiKey
        ------             ------          ------
        https://google.com Updated API key *****************

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Source,

        [Parameter(Mandatory = $true, Position = 1)]
        [String] $ApiKey
    )

    if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {
        Try {
            if ($PSCmdlet.ShouldProcess($Source)) {
                $CommandResult = Invoke-ChocoCommand -Arguments "apikey", "-s=$Source", "-k=$ApiKey"

                if ($CommandResult.Status -ne "Success") {
                    Write-Error "Error during processing the request. See the chocolatey log for details."
                    Exit 1
                }

                if ($CommandResult.RawOutput -like "Nothing to change*") {
                    Write-Verbose "Nothing to change"
                    $Status = "Nothing to change"
                }
                elseif ($CommandResult.RawOutput -like "Updated API key*") {
                    Write-Verbose "Updated API key"
                    $Status = "Updated API key"
                }
                elseif ($CommandResult.RawOutput -like "Added API key*") {
                    Write-Verbose "Added API key"
                    $Status = "Added API key"
                }

                $Response = [PSCustomObject]@{
                    Source = $Source
                    Status = $Status
                }


            }
        }
        Catch {
            $Response = [PSCustomObject]@{
                Source = $Source
                Status = "Error. Cannot process the request."
            }
        }

        Return $Response
    }
}

Function Set-ChocoConfig {
    <#
    .SYNOPSIS
        Sets the specified configuration option.
    .DESCRIPTION
        Sets the specified configuration option.
    .PARAMETER Name
        The name of the config setting.
    .PARAMETER Value
        The value of the config setting.

    .EXAMPLE
        Set-ChocoConfig -Name containsLegacyPackageInstalls -Value true

        Name                          Value Status
        ----                          ----- ------
        containsLegacyPackageInstalls true  Updated


    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateSet("cacheLocation",
            "containsLegacyPackageInstalls",
            "commandExecutionTimeoutSeconds",
            "proxy",
            "proxyUser",
            "proxyPassword",
            "webRequestTimeoutSeconds",
            "proxyBypassList",
            "proxyBypassOnLocal",
            "upgradeAllExceptions",
            "defaultTemplateName",
            "defaultPushSource",
            "virusCheckMinimumPositives",
            "virusScannerType",
            "genericVirusScannerPath",
            "genericVirusScannerArgs",
            "genericVirusScannerValidExitCodes",
            "genericVirusScannerTimeoutInSeconds",
            "maximumDownloadRateBitsPerSecond",
            "serviceInstallsDefaultUserName",
            "serviceInstallsDefaultUserPassword",
            "backgroundServiceAllowedCommands",
            "centralManagementServiceUrl",
            "centralManagementReportPackagesTimerIntervalInSeconds",
            "centralManagementReceiveTimeoutInSeconds",
            "centralManagementSendTimeoutInSeconds",
            "centralManagementCertificateValidationMode",
            "centralManagementMaxReceiveMessageSizeInBytes",
            "centralManagementClientCommunicationSaltAdditivePassword",
            "centralManagementServiceCommunicationSaltAdditivePassword",
            "centralManagementDeploymentCheckTimerIntervalInSeconds",
            "intuneTenantGUID",
            "intuneAuthenticationUrl",
            "intuneApiUrl",
            "intuneRetryIntervalInSeconds",
            "intuneUploadTimeoutInSeconds",
            "intuneUploadChunkSizeInMegabytes",
            "logRetentionPolicyInDays")]
        [String] $Name,

        [Parameter(Mandatory = $true, Position = 1)]
        [String] $Value
    )

    if ((Test-ChocoInstalled) -And (Confirm-IsAdmin)) {
        Try {
            if ($PSCmdlet.ShouldProcess($Source)) {
                $CommandResult = Invoke-ChocoCommand -Arguments "config", "set", "$Name", "$Value"
                Write-Verbose $CommandResult.RawOutput

                if ($CommandResult.Status -ne "Success") {
                    Write-Error "Error during processing the request. See the chocolatey log for details."
                    Exit 1
                }

                if ($CommandResult.RawOutput -like "Nothing to change*") {
                    Write-Verbose "Nothing to change"
                    $Status = "Nothing to change"
                }
                elseif ($CommandResult.RawOutput -like "Updated $Name = *") {
                    Write-Verbose "Updated $Name with value $Value"
                    $Status = "Updated"
                }

                $Response = [PSCustomObject]@{
                    Name   = $Name
                    Value  = $Value
                    Status = $Status
                }


            }
        }
        Catch {
            $Response = [PSCustomObject]@{
                Name   = $Name
                Status = "Error. Cannot process the request."
            }
        }

        Return $Response
    }
}

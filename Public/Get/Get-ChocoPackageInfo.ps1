Function Get-ChocoPackageInfo {
    <#
    .SYNOPSIS
        Gets information about a Chocolatey package.

    .DESCRIPTION
        Gets information about a Chocolatey package.

    .PARAMETER Name
        The name of the package.

    .EXAMPLE
        Get-ChocoPackageInfo -Name rufus

        Title           : Rufus
        TotalDownloads  : 540469
        Checksum        : z4iOzCoWEYvc/VuSHxqc9Y09IZPioI29lq0SeewfEajtrPfMpXI4XKGtZJc1un2/dw20TLU/7/2mTlBRW7dR1A==
        Tags            : liveusb usb bootdisk linux windows foss
        Summary         : Create bootable USB drives from Windows and Linux images
        SoftwareSite    : https://rufus.ie/
        SoftwareLicense : https://github.com/pbatard/rufus/blob/master/LICENSE.txt
        SoftwareSource  : https://github.com/pbatard/rufus/
        Description     : Rufus is a utility that helps format and create bootable USB flash drives, such as USB keys/pendrives, memory sticks, etc.      It can be especially useful for cases where:      - you need to create USB installation media from bootable ISOs (Windows, Linux, UEFI, etc.)   - you need to work on a system that doesn't have an OS installed   - you need to flash a BIOS or other
                        firmware from DOS   - you want to run a low-level utility      ## Features      * Format USB, flash card and virtual drives to FAT/FAT32/NTFS/UDF/exFAT/ReFS   * Create DOS bootable USB drives, using [FreeDOS](http://www.freedos.org/) or MS-DOS   * Create BIOS or UEFI bootable drives, including [UEFI bootable NTFS](https://github.com/pbatard/uefi-ntfs)   * Create bootable
                        drives from bootable ISOs (Windows, Linux, etc.)   * Create bootable drives from bootable disk images, including compressed ones   * Create [Windows To Go](https://en.wikipedia.org/wiki/Windows_To_Go) drives   * Twice as fast as Microsoft's USB/DVD tool or UNetbootin, on ISO -> USB creation.   * Perform bad blocks checks, including detection of "fake" flash drives   *
                        Compute MD5, SHA-1 and SHA-256 checksums of the selected image   * Modern and familiar UI, with more than [35 languages natively supported](https://github.com/pbatard/rufus/wiki/FAQ#What_languages_are_natively_supported_by_Rufus)   * Small footprint. No installation required.   * Portable   * 100% [Free Software](http://www.gnu.org/philosophy/free-sw.en.html) ([GPL
                        v3](http://www.gnu.org/licenses/gpl-3.0.en.html))      * [FAQ](https://github.com/pbatard/rufus/wiki/FAQ)   * [Supported ISOs](https://rufus.ie/en_IE.html/#ref2)         ![screenshot](https://cdn.jsdelivr.net/gh/chocolatey/chocolatey-coreteampackages@6fdcf3ea1d6e0661c3b05ead97a70f92eaba218a/automatic/rufus/screenshot.png)  Release Notes:
                        https://github.com/pbatard/rufus/blob/master/ChangeLog.txt

    .OUTPUTS
        PSCustomObject
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String] $Name
    )

    begin {
        if (-Not (Test-ChocoInstalled)) {
            Exit 1
        }
    }
    process {
        $ChocoCommandOutput = Invoke-ChocoCommand -Arguments "info", $Name, "--no-color" -ErrorAction SilentlyContinue -BypassDefaultArgs

        Try {
            $Title = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Title:.*$").ToString().Replace("Title: ", "").Split("|")[0].Trim()
        }
        Catch {
            $Title = "Cannot parse content"
        }

        Try {
            $Checksum = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Package Checksum:.*$").ToString().Replace("Package Checksum: ", "").Replace("(SHA512)", "").Replace("'", "").Trim()
        }
        Catch {
            $Checksum = "Cannot parse content"
        }

        Try {
            $Tags = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Tags: .*$").ToString().Replace("Tags: ", "").Trim()
        }
        Catch {
            $Tags = "Cannot parse content"
        }

        Try {
            $Summary = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Summary: .*$").ToString().Replace("Summary: ", "").Trim()
        }
        Catch {
            $Summary = "Cannot parse content"
        }

        Try {
            $SoftwareSite = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Software Site: .*$").ToString().Replace("Software Site: ", "").Trim()
        }
        Catch {
            $SoftwareSite = "Cannot parse content"
        }

        Try {
            $SoftwareLicense = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Software License: .*$").ToString().Replace("Software License: ", "").Trim()
        }
        Catch {
            $SoftwareLicense = "Cannot parse content"
        }

        Try {
            $SoftwareSource = ($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Software Source: .*$").ToString().Replace("Software Source: ", "").Trim()
        }
        Catch {
            $SoftwareSource = "Cannot parse content"
        }

        Try {
            $Description = (([regex]::matches($ChocoCommandOutput.RawOutput, " Description:((.|\n)*)")).value).Replace("Description: ", "").Replace("1 packages found.", "").Trim()
        }
        Catch {
            $Description = "Cannot parse content"
        }

        Try {
            $TotalDownloads = [int](($ChocoCommandOutput.RawOutput | Select-String -Pattern "^ Number of Downloads: ([0-9]+)").ToString().Replace("Number of Downloads: ", "").Split("|")[0].Trim())
        }
        Catch {
            $TotalDownloads = "Cannot parse content"
        }

        Return [PSCustomObject]@{
            Title           = $Title
            TotalDownloads  = $TotalDownloads
            Checksum        = $Checksum
            Tags            = $Tags
            Summary         = $Summary
            SoftwareSite    = $SoftwareSite
            SoftwareLicense = $SoftwareLicense
            SoftwareSource  = $SoftwareSource
            Description     = $Description
        }

    }
    end {}




}

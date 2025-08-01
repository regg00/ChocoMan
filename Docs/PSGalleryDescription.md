![Tests](https://github.com/regg00/ChocoMan/actions/workflows/test-and-deploy.yaml/badge.svg)
![Docs](https://github.com/regg00/ChocoMan/actions/workflows/build-doc.yaml/badge.svg)
[![GitHub issues](https://img.shields.io/github/issues/regg00/ChocoMan.svg)](https://github.com/regg00/ChocoMan/issues)

# ChocoMan

A PowerShell wrapper around Chocolatey.

## Why it exists

Mostly for fun, but I also got tired of parsing raw output of Chocolatey commands in my deployment scripts. I figured having each command outputs a standardized PowerShell object would help somehow.

## Installing this module

This module is available in [PowerShell Gallery](https://www.powershellgallery.com/packages/ChocoMan):

```powershell
Install-Module ChocoMan -Scope AllUsers
```

Or, download it from here and save all of the files somewhere in your `$PSModulePath`.

## Before you start

Before using this package, you need to make sure that Chocolatey is installed on your device.

You can valide this with the `choco --version` command.

```powershell
PS C:\> choco --version
2.1.0
```

You can also install it using this module with the `Install-Choco` command.

```powershell
PS C:\> Install-Choco
Chocolatey v2.1.0 installed
```

## Using the module

First things first, you need to import it `Import-Module ChocoMan`

## Hide the activity indicator

The activity indicator can be hidden by setting the `ProgressPreference` variable to `SilentlyContinue`

```powershell
PS C:\> Set-Variable ProgressPreference SilentlyContinue ; Get-ChocoOutdated
```


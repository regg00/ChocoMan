![Tests](https://github.com/regg00/ChocoMan/actions/workflows/test-and-deploy.yaml/badge.svg)
![Docs](https://github.com/regg00/ChocoMan/actions/workflows/build-doc.yaml/badge.svg)
[![GitHub issues](https://img.shields.io/github/issues/regg00/ChocoMan.svg)](https://github.com/regg00/ChocoMan/issues)

<img src="./Docs/icon.png" height="200">

# ChocoMan

A PowerShell wrapper around Chocolatey.

## Why it exists

Mostly for fun, but I also got tired of parsing raw output of Chocolatey commands in my deployment scripts. I figured having each command outputs a standardized PowerShell object would help somehow.

## Installing this module

This module is available in [PowerShell Gallery](https://www.powershellgallery.com/packages/ChocoMan):

```powershell
Install-Module ChocoMan
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

### Demo

<img src="./Docs/demo.gif" height="500">

### Functions

Here's the status of each functions:

| Command                                                    | Status             | Notes                                                                              |
| ---------------------------------------------------------- | ------------------ | ---------------------------------------------------------------------------------- |
| [Get-ChocoApiKey](./Docs/Get-ChocoApiKey.md)               | :white_check_mark: | Retrieves, saves or deletes an API key for a particular source                     |
| [Get-ChocoConfig ](./Docs/Get-ChocoConfig.md)              | :white_check_mark: | Retrieves the chocolatey configuration                                             |
| [Get-ChocoFeature ](./Docs/Get-ChocoFeature.md)            | :white_check_mark: | Retrieves the chocolatey features                                                  |
| [Get-ChocoOutdated](./Docs/Get-ChocoOutdated.md)           | :white_check_mark: | Get the list of outdated chocolatey packages.                                      |
| [Get-ChocoPackage](./Docs/Get-ChocoPackage.md)             | :white_check_mark: | Get a specific locally installed chocolatey package.                               |
| [Get-ChocoSources](./Docs/Get-ChocoSources.md)             | :white_check_mark: | Get the list of chocolatey sources.                                                |
| [Get-ChocoVersion](./Docs/Get-ChocoVersion.md)             | :white_check_mark: | Get the version of chocolatey.                                                     |
| [Get-ChocoManVersion](./Docs/Get-ChocoManVersion.md)       | :white_check_mark: | Get the version of ChocoMan.                                                       |
| [Get-ChocoPackageInfo](./Docs/Get-ChocoPackageInfo.md)     | :white_check_mark: | Get information on an existing package.                                            |
| [Set-ChocoApiKey](./Docs/Set-ChocoApikey.md)               | :white_check_mark: | Edit API keys                                                                      |
| [Set-ChocoConfig](./Docs/Set-ChocoConfig.md)                                            | :white_check_mark: | Edit chocolatey configuration                                                      |
| [Search-ChocoPackage](./Docs/Search-ChocoPackage.md)       | :white_check_mark: | Search for a chocolatey package.                                                   |
| [Add-ChocoApiKey](./Docs/Set-ChocoApiKey.md)               | :white_check_mark: | Adds a new API. Aliases to Set-ChocoApiKey.                                        |
| [Add-ChocoSource ](./Docs/Add-ChocoSource.md)              | :white_check_mark: | Adds a new chocolatey source                                                       |
| [Install-Choco](./Docs/Install-Choco.md)                   | :white_check_mark: | Install chocolatey.                                                                |
| [Install-ChocoPackage](./Docs/Install-ChocoPackage.md)     | :white_check_mark: | Installs a chocolatey package.                                                     |
| [Uninstall-ChocoPackage](./Docs/Uninstall-ChocoPackage.md) | :white_check_mark: | Uninstalls a chocolatey package.                                                   |
| [Update-ChocoPackage](./Docs/Update-ChocoPackage.md)       | :white_check_mark: | Updates a chocolatey package.                                                      |
| [Remove-ChocoSource ](./Docs/Remove-ChocoSource.md)        | :white_check_mark: | Removes a chocolatey source.                                                        |
| [New-ChocoPackage ](./Docs/New-ChocoPackage.md)            | :white_check_mark: | Generates files necessary for a chocolatey package from a template.                 |
| [Export-ChocoPackage ](./Docs/Export-ChocoPackage.md)      | :white_check_mark: | Packages nuspec, scripts, and other Chocolatey package resources into a nupkg file. |
| Publish-ChocoPackage                                       | :soon:             | Pushes a compiled nupkg to a source.                                                |


## What else can I do?

There is plenty of help to read. Get started [here](./Docs/)

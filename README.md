![Tests](https://github.com/regg00/ChocoMan/actions/workflows/run-tests.yaml/badge.svg)

<img src="./Docs/icon.png" height="200">

# ChocoMan

A PowerShell wrapper around Chocolatey.

## Installing this module

This module is available in [PowerShell Gallery](https://www.powershellgallery.com/packages/PSPsat):

```powershell
PS C:\> Install-Module ChocoMan
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

### Functions available

The following commands are available:

| Command                                                | Status             | Notes                                                |
| ------------------------------------------------------ | ------------------ | ---------------------------------------------------- |
| [Get-ChocoOutdated](./Docs/Get-ChocoOutdated.md)       | :white_check_mark: | Get the list of outdated chocolatey packages.        |
| [Get-ChocoPackage](./Docs/Get-ChocoPackage.md)         | :white_check_mark: | Get a specific locally installed chocolatey package. |
| [Get-ChocoPackages](./Docs/Get-ChocoPackages.md)       | :white_check_mark: | Get the list of all installed chocolatey packages.   |
| [Get-ChocoSources](./Docs/Get-ChocoSources.md)         | :white_check_mark: | Get the list of chocolatey sources.                  |
| [Get-ChocoVersion](./Docs/Get-ChocoVersion.md)         | :white_check_mark: | Get the version of chocolatey.                       |
| [Search-ChocoPackage](./Docs/Search-ChocoPackage.md)   | :white_check_mark: | Search for a chocolatey package.                     |
| [Install-ChocoPackage](./Docs/Install-ChocoPackage.md) | :test_tube:        | Search for a chocolatey package.                     |

## What else can I do?

There is plenty of help to read. Get started [here](./Docs/)

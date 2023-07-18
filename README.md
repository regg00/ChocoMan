![Tests](https://github.com/regg00/ChocoMan/actions/workflows/run-tests.yaml/badge.svg)

<img src="./docs/logo.png" height="200">

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

### Packages

The following commands are available for packages:

| Command           | Status | Notes                                                |
| ----------------- | ------ | ---------------------------------------------------- |
| Get-ChocoPackages | Tested | Get the list of all installed chocolatey packages.   |
| Get-ChocoPackage  | Tested | Get a specific locally installed chocolatey package. |

## What else can I do?

There is plenty of help to read. Get started [here](./docs/)

---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoOutdated

## SYNOPSIS
Get the list of outdated chocolatey packages.

## SYNTAX

```
Get-ChocoOutdated [<CommonParameters>]
```

## DESCRIPTION
Get the list of outdated chocolatey packages.

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoOutdated
Name             CurrentVersion AvailableVersion Pinned
----             -------------- ---------------- ------
adobereader      2023.3.20201.1 2023.003.20215   false
github-desktop   3.2.3          3.2.6            false
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSCustomObject
## NOTES

## RELATED LINKS

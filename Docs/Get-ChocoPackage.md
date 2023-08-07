---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoPackage

## SYNOPSIS
Get a specific locally installed chocolatey package.
Returns all packages if no name is specified.

## SYNTAX

```
Get-ChocoPackage [[-Name] <String>] [-Outdated] [<CommonParameters>]
```

## DESCRIPTION
Get a specific locally installed chocolatey package.
Returns all packages if no name is specified.

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoPackage -Name rufus
Name Version
---- -------
rufus  3.0.18
```

### EXAMPLE 2
```
Get-ChocoPackage -Outdated
Name                              CurrentVersion    AvailableVersion Pinned
----                              --------------    ---------------- ------
7zip                              22.1.0            23.1.0           false
7zip.install                      22.1.0            23.1.0           false
```

## PARAMETERS

### -Name
The name of the package to get.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Outdated
Get only outdated packages.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSCustomObject
## NOTES

## RELATED LINKS

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
Get-ChocoOutdated [[-Source] <String>] [-PreRelease] [-ProgressAction <ActionPreference>] [<CommonParameters>]
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

### -PreRelease
Include pre-release versions in the search.

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

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source
The source to get the list of outdated packages from.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSCustomObject
## NOTES

## RELATED LINKS

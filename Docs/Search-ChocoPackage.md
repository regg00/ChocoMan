---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Search-ChocoPackage

## SYNOPSIS
Search for a chocolatey package.

## SYNTAX

```
Search-ChocoPackage [-Name] <String> [-Source <String>] [-Exact] [<CommonParameters>]
```

## DESCRIPTION
Search for a chocolatey package.

## EXAMPLES

### EXAMPLE 1
```
Search-ChocoPackage -Name "vlc"
Name                Version
----                -------
vlc                 3.0.18
vlc.install         3.0.18
vlc.portable        3.0.18
vlc-nightly         4.0.0.20230713
```

### EXAMPLE 2
```
Search-ChocoPackage -Name "vlc" -Source "chocolatey"
Name                Version
----                -------
vlc                 3.0.18
vlc.install         3.0.18
vlc.portable        3.0.18
vlc-nightly         4.0.0.20230713
```

### EXAMPLE 3
```
Search-ChocoPackage -Name "vlc" -Source "chocolatey" -Exact
Name Version
---- -------
vlc  3.0.18
```

## PARAMETERS

### -Name
The name of the package to search for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source
Search on a specific source.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Chocolatey
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exact
Search for an exact match.

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

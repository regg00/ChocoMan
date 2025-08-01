---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Search-ChocoPackage

## SYNOPSIS
Search for a chocolatey package.
If no name is specified this will return all available packages.

## SYNTAX

```
Search-ChocoPackage [[-Name] <String>] [-Source <String>] [-Exact] [-PreRelease] [<CommonParameters>]
```

## DESCRIPTION
Search for a chocolatey package. 
If no name is specified this will return all available packages.

## EXAMPLES

### EXAMPLE 1
```
Search-ChocoPackage -Name "rufus"
```

Name                Version
----                -------
rufus                 3.0.18
rufus.install         3.0.18
rufus.portable        3.0.18
rufus-nightly         4.0.0.20230713

### EXAMPLE 2
```
Search-ChocoPackage -Name "rufus" -Source "chocolatey"
```

Name                Version
----                -------
rufus                 3.0.18
rufus.install         3.0.18
rufus.portable        3.0.18
rufus-nightly         4.0.0.20230713

### EXAMPLE 3
```
Search-ChocoPackage -Name "rufus" -Source "chocolatey" -Exact
```

Name Version
---- -------
rufus  3.0.18

### EXAMPLE 4
```
Search-ChocoPackage
```

Name                Version
----                -------
rufus                 3.0.18
rufus.install         3.0.18
... 
...
... 
...

## PARAMETERS

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

### -Name
The name of the package to search for.
Omit to return all available packages.

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

### -Source
Search on a specific source.
Defaults to the official Chocolatey repository.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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

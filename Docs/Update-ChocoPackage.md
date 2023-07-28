---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Update-ChocoPackage

## SYNOPSIS
Updates a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to install a package.

## SYNTAX

```
Update-ChocoPackage [-Name] <String> [-Source <String>] [-Upgrade] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Updates a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to install a package.

## EXAMPLES

### EXAMPLE 1
```
Update-ChocoPackage -Name vlc
```

### EXAMPLE 2
```
Update-ChocoPackage -Name vlc -Force
```

## PARAMETERS

### -Force
Will force the reinstallation of the package.

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
The name of the package to upgrade.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Source
{{ Fill Source Description }}

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

### -Upgrade
{{ Fill Upgrade Description }}

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

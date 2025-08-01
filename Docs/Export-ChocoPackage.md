---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Export-ChocoPackage

## SYNOPSIS
Bundles a Chocolatey package in a .nupkg file for publishing.

## SYNTAX

```
Export-ChocoPackage [-Path] <String> [[-OutputDir] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Bundles a Chocolatey package in a .nupkg file for publishing.

## EXAMPLES

### EXAMPLE 1
```
Export-ChocoPackage -Path C:\test\testing.nuspec
```

### EXAMPLE 2
```
Export-ChocoPackage -Path C:\test\testing.nuspec -OutputDir C:\output
```

## PARAMETERS

### -OutputDir
The local path where the package files will be created.
Defaults to current directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: "$PWD"
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path of the nuspec file.

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

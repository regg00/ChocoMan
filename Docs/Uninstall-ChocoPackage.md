---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Uninstall-ChocoPackage

## SYNOPSIS
Uninstalls a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to uninstall a package.

## SYNTAX

```
Uninstall-ChocoPackage [-Name] <Object> [-Force] [-AskForConfirmation] [<CommonParameters>]
```

## DESCRIPTION
Uninstalls a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to uninstall a package.

## EXAMPLES

### EXAMPLE 1
```
Uninstall-ChocoPackage -Name vlc
```

## PARAMETERS

### -AskForConfirmation
Ask for confirmation before uninstalling the package.

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

### -Force
Will force the uninstallation of the package.

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
The name of the package to uninstall.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### String
## NOTES

## RELATED LINKS

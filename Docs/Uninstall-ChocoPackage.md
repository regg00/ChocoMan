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

## SYNTAX

```
Uninstall-ChocoPackage [-Name] <String[]> [-Force] [-AskForConfirmation] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Uninstalls a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to uninstall a package.
This function also accepts pipeline input.

## EXAMPLES

### EXAMPLE 1
```
Uninstall-ChocoPackage -Name rufus
Name  Version Status
----  ------- ------
rufus 4.2.0   Uninstalled
```

### EXAMPLE 2
```
Uninstall-ChocoPackage -Name rufus -Force
Name  Version Status
----  ------- ------
rufus 4.2.0   Uninstalled
```

### EXAMPLE 3
```
Uninstall-ChocoPackage -Name rufus -AskForConfirmation
Name  Version Status
----  ------- ------
rufus 4.2.0   Uninstalled
```

### EXAMPLE 4
```
Get-ChocoPackage -Name rufus | Uninstall-ChocoPackage
Name  Version Status
----  ------- ------
rufus 4.2.0   Uninstalled
```

### EXAMPLE 5
```
Uninstall-ChocoPackage -Name rufus -WhatIf
What if: Performing the operation "Uninstall-ChocoPackage" on target "rufus".
```

Name  Version Status
----  ------- ------
rufus 4.2.0   Would be uninstalled

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
You can specify more than one package.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
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

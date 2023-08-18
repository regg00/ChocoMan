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
Update-ChocoPackage [-Name] <String> [-Source <String>] [-Force] [-PreRelease] [-AskForConfirmation] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to install a package.

## EXAMPLES

### EXAMPLE 1
```
Update-ChocoPackage -Name rufus
Name  Version Status
----  ------- ------
rufus         Unhandled
```

### EXAMPLE 2
```
Update-ChocoPackage -Name rufus -WhatIf
What if: Performing the operation "Install-ChocoPackage" on target "rufus".
```

Name  Version Status
----  ------- ------
rufus         Unhandled

### EXAMPLE 3
```
Update-ChocoPackage -Name rufus -Force
Name  Version Status
----  ------- ------
rufus         Unhandled
```

## PARAMETERS

### -AskForConfirmation
If set, will ask for confirmation before updating the package.

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

### -PreRelease
If set, will include pre-release versions in the upgrade process.

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
{{ Fill Source Description }}

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

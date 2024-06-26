---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Install-ChocoPackage

## SYNOPSIS
Installs a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to install a package.

## SYNTAX

```
Install-ChocoPackage [-Name] <String[]> [-Source <String>] [-Upgrade] [-Force] [-PreRelease]
 [-AskForConfirmation] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Installs a chocolatey package.
Doesn't asks for confirmation by default.
Just like Chocolatey, you may need admin rights to install a package.

## EXAMPLES

### EXAMPLE 1
```
Install-ChocoPackage -Name rufus
Name  Version Status
----  ------- ------
rufus 4.2.0   Installed
```

### EXAMPLE 2
```
Install-ChocoPackage -Name rufus -Source chocolatey
Name  Version Status
----  ------- ------
rufus 4.2.0   Installed
```

### EXAMPLE 3
```
Install-ChocoPackage -Name rufus -Source chocolatey -Upgrade
Name  Version Status
----  ------- ------
rufus 4.2.0   Installed
```

### EXAMPLE 4
```
Install-ChocoPackage -Name rufus -WhatIf
What if: Performing the operation "Install-ChocoPackage" on target "rufus".
```

Name  Version Status
----  ------- ------
rufus 4.2.0   Chocolatey would have used NuGet to install packages (if they are not already installed)

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
The name of the package to install.
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

### -PreRelease
If set, includes pre-release packages in the installation.

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
The source to install the package from.

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

### -Upgrade
If the package should be upgraded if it already exists.

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

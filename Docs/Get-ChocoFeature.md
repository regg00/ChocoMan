---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoFeature

## SYNOPSIS
Retrieves the Chocolatey feature

## SYNTAX

```
Get-ChocoFeature [[-Name] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves the Chocolatey feature

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoFeature
Name                                                 Enabled SetExplicitly Description
----                                                 ------- ------------- -----------
checksumFiles                                        true    false         Checksum files when pulled in from internet (based on package).
autoUninstaller                                      true    false         Uninstall from programs and features without requiring an explicit uninstall script.
allowGlobalConfirmation                              false   false         Prompt for confirmation in scripts or bypass.
failOnAutoUninstaller                                false   false         Fail if automatic uninstaller fails.
```

### EXAMPLE 2
```
Get-ChocoFeature -Name checksumFiles
Name          Enabled SetExplicitly Description
----          ------- ------------- -----------
checksumFiles true    false         Checksum files when pulled in from internet (based on package).
```

## PARAMETERS

### -Name
The name of the feature to retrieve

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSCustomObject
## NOTES

## RELATED LINKS

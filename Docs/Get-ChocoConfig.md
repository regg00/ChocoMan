---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoConfig

## SYNOPSIS
Retrieves the Chocolatey configuration

## SYNTAX

```
Get-ChocoConfig [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves the Chocolatey configuration

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoConfig
```

Name                                                      Value                             Description
---                                                       -----                             -----------
cacheLocation                                                                               Cache location if not TEMP folder.
Replaces \`$env:TEMP\` value for choco.exe proâ€¦
containsLegacyPackageInstalls                             true                              Install has packages installed prior to 0.9.9 series.
commandExecutionTimeoutSeconds                            2700                              Default timeout for command execution.
'0' for infinite.

### EXAMPLE 2
```
Get-ChocoConfig -Name cacheLocation
```

Name          Value Description
----          ----- -----------
cacheLocation       Cache location if not TEMP folder.
Replaces \`$env:TEMP\` value for choco.exe process.
It is highly recommended

## PARAMETERS

### -Name
The name of the configuration to retrieve

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

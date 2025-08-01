---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoSource

## SYNOPSIS
Retrieves the configured Chocolatey sources

## SYNTAX

```
Get-ChocoSource [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves the configured Chocolatey sources

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoSource
```

Name                Uri                                              Disabled BypassProxy SelfService AdminOnly Priority User
----                ---                                              -------- ----------- ----------- --------- -------- ----
chocolatey          https://community.chocolatey.org/api/v2/         false    false       false       false     0
chocolatey.licensed https://licensedpackages.chocolatey.org/api/v2/  false    false       false       false     10       customer

### EXAMPLE 2
```
Get-ChocoSource -Name chocolatey
```

Name       Uri                                      Disabled BypassProxy SelfService AdminOnly Priority User
----       ---                                      -------- ----------- ----------- --------- -------- ----
chocolatey https://community.chocolatey.org/api/v2/ false    false       false       false     0

## PARAMETERS

### -Name
The name of the source to retrieve

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

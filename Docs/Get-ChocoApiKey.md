---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoApiKey

## SYNOPSIS
Retrieves, saves or deletes an API key for a particular source

## SYNTAX

```
Get-ChocoApiKey [[-Source] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves, saves or deletes an API key for a particular source

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoApiKey -Source https://chocolatey.org
Source                 Authentication
------                 --------------
https://chocolatey.org (Authenticated)
```

## PARAMETERS

### -Source
The source to retrieve, save or delete the API key for

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
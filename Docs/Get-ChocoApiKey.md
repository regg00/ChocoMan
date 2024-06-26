---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Get-ChocoApiKey

## SYNOPSIS
Retrieves an API key for a particular source

## SYNTAX

```
Get-ChocoApiKey [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves an API key for a particular source

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoApiKey
Source                 Key
------                 --------------
https://chocolatey.org AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAxc9DNMivjki8zbeKBN8X5wQA
https://cdfgdgdfdg.org AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAxc9DNMivjki8zbeKBN8X5wQA
```

### EXAMPLE 2
```
Get-ChocoApiKey -Source https://chocolatey.org
Source                 Key
------                 ---
https://chocolatey.org AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAxc9DNMivjki8zbeKBN8X5wQA
```

## PARAMETERS

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

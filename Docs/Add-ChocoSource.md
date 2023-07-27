---
external help file: ChocoMan-help.xml
Module Name: ChocoMan
online version:
schema: 2.0.0
---

# Add-ChocoSource

## SYNOPSIS
Add a new chocolatey source.

## SYNTAX

```
Add-ChocoSource [-Name] <String> [-Uri] <String> [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Add a new chocolatey source.

## EXAMPLES

### EXAMPLE 1
```
Add-ChocoSource
Name                Uri                                                 UserName
----                ---                                                 --------
chocolatey          https://community.chocolatey.org/api/v2/
```

## PARAMETERS

### -Credential
The credential to use to access the source.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the source.

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

### -Uri
The Uri of the source.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

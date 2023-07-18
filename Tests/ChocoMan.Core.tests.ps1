<#
    .SYNOPSIS
        Core test suite for the ChocoMan module.
#>

BeforeAll {
    $ModulePath = Split-Path -Parent -Path (Split-Path -Parent -Path $PSCommandPath)
    $ModuleName = 'ChocoMan'
    $ManifestPath = "$($ModulePath)\$($ModuleName).psd1"
    if (Get-Module -Name $ModuleName) {
        Remove-Module $ModuleName -Force
    }
    Import-Module $ManifestPath -Verbose:$False
    $Script:ModuleInformation = Import-Module -Name $ManifestPath -PassThru

}

# Test that the manifest is generally correct.
Describe 'Core' {
    It 'Manifest is valid' {
        {
            Test-ModuleManifest -Path $ManifestPath -ErrorAction Stop -WarningAction SilentlyContinue
        } | Should -Not -Throw
    }

    It 'Root module is correct' {
        $Script:ModuleInformation.RootModule | Should -Be ".\$($ModuleName).psm1"
    }

    It 'Has a description' {
        $Script:ModuleInformation.Description | Should -Not -BeNullOrEmpty
    }

    It 'GUID is correct' {
        $Script:ModuleInformation.GUID | Should -Be 'a1f003a9-6a9c-4d83-a6ae-b857b91f766d'
    }

    It 'Version is valid' {
        $Script:ModuleInformation.Version -As [Version] | Should -Not -BeNullOrEmpty
    }

    It 'Copyright is present' {
        $Script:ModuleInformation.Copyright | Should -Not -BeNullOrEmpty
    }

    It 'Project URI is correct' {
        $Script:ModuleInformation.ProjectUri | Should -Be 'https://github.com/regg00/ChocoMan'
    }

    It 'PowerShell Gallery tags is not empty' {
        $Script:ModuleInformation.Tags.count | Should -Not -BeNullOrEmpty 
    }

    It 'PowerShell Gallery tags do not contain spaces' {
        foreach ($Tag in $Script:ModuleInformation.Tags) {
            $Tag -NotMatch '\s' | Should -Be $True
        }
    }
}

Describe 'Module ChocoMan loads' {
    It 'Passed Module load' {
        Get-Module -Name 'ChocoMan' | Should -Not -Be $null
    }
}

Describe 'Functional tests' {
    It 'Return only the version number' {
        $Versions = @('2.1.0', '2.0.0', '1.4.0', '1.3.1' )
        Get-ChocoVersion | Should -BeIn $Versions
    }

    It 'Package "chocolatey" should be installed' {
        (Get-ChocoPackages | Where-Object { $_.Name -like 'chocolatey' }).Name | Should -Be 'chocolatey'
    }

    It 'Source "chocolatey" should be available' {
        (Get-ChocoSources | Where-Object { $_.Name -eq 'chocolatey' }).Name | Should -Be 'chocolatey'
    }
}
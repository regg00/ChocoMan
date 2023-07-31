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

Describe 'ApiKey' {
    It 'Should return a valid API key' {
        { Get-ChocoApiKey } | Should -Not -Throw
    }
    It 'Should add a new Api Key' {
        (Add-ChocoApiKey -Source 'https://google.com' -ApiKey '1234567890').Status | Should -Match "Added API key|Updated API key"
    }
}

Describe 'Configuration' {
    It 'Should return a valid configuration' {
        Get-ChocoConfig | Should -Not -BeNullOrEmpty
    }
    It 'Should return a valid feature set' {
        Get-ChocoFeature | Should -Not -BeNullOrEmpty
    }

}
Describe 'Install' {


}
Describe 'Packages' {
    It 'Package "chocolatey" should be installed' {
        (Get-ChocoPackage -Name chocolatey).Name | Should -Be "chocolatey"
    }

    It 'Get-ChocoPackage without name should return all packages' {
        (Get-ChocoPackage).Length | Should -BeGreaterThan 1
    }
    It 'Should be able to install rufus' {
        { Install-ChocoPackage -Name rufus } | Should -Not -Throw
    }

    It 'Should be able to install multiple packages' {
        { Install-ChocoPackage -Name rufus, 7zip } | Should -Not -Throw
    }

    It 'Should be able to remove rufus' {
        { Uninstall-ChocoPackage -Name rufus } | Should -Not -Throw
    }


}
Describe 'Sources' {
    It 'Source "chocolatey" should be available' {
        (Get-ChocoSource -Name chocolatey).Name | Should -Be 'chocolatey'
    }

    It 'Get-ChocoSource without name should return all sources' {
        (Get-ChocoSource).Length | Should -BeGreaterOrEqual 1
    }

    It 'Adds a dummy source' {
        (Add-ChocoSource -Name google -Uri "https://google.com").Name | Should -Be 'google'
    }
}

Describe 'Version' {
    It 'Returns a valid version number' {
        $Versions = @('2.1.0', '2.0.0', '1.4.0', '1.3.1' )
        Get-ChocoVersion | Should -BeIn $Versions
    }
}

AfterAll {
    #Remove-Module -Name $ModuleName -Force
    choco sources remove -n google -y
    choco apikey remove -s https://google.com
}



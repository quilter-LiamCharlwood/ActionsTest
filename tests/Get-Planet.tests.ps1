BeforeAll {
    #import the module and build the function
    Import-Module -Name .\functions\Get-Planet.ps1
}

Describe 'Get-Planet' {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = Get-Planet
        $allPlanets.Count | Should -Be 8
    }
    it 'Given one planet, it should return one planet' {
        $allPlanets = Get-Planet 'mars'
        $allPlanets.name.Count | Should -Be 1
    }
    it 'Given planet "mars", it should return planet "mars"' {
        $allPlanets = Get-Planet 'mars'
        $allPlanets.Name | Should -Be "mars"
    }
}

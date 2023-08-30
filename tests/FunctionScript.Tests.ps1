BeforeAll {
    # Get-Emoji.Tests.ps1 - .Tests.ps1 + .ps1 = Get-Emoji.ps1
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe "Get-QcredsForServer" {
    It "Returns Get-QCred AFSUKDMN01" {
        Get-QcredsForServer -svr "AFSUKDMN01\Server" | Should -Be (Get-QCred AFSUKDMN01)
    }
}
BeforeAll {
    # Get-Emoji.Tests.ps1 - .Tests.ps1 + .ps1 = Get-Emoji.ps1
    .\Functions\FunctionScript.ps1
}

#mock .cred files taht get-qcred will return.
Describe "Test Set-QcredsForServer return values" {
    Context "Used for setting credentials based on server name." {
        BeforeAll {
            Mock Get-QCred -MockWith {
                [PSCustomObject]@{
                    UserName = "AFSUKDMN01\Bacon"
                    Password = "*****************"
                }
            }
        }
        It "Returns that the credential is set" {
            Set-QCredsForServer -svr "Server.skandia.co.uk" | Should -BeTrue
        }
        It "Returns the credentials that are the set correctly" {
            $Creds = Set-QcredsForServer -svr "Server.skandia.co.uk" 
            $Creds.UserName | Should -Be (Get-QCred AFSUKDMN01).UserName
        }
    }
    Context "do the thing again"{
    BeforeAll {
        Mock Get-QCred -MockWith {
            [PSCustomObject]@{
                UserName = "core.local\Waffles"
                Password = "*****************"
            }
        }
    }
        It "Returns that the credential is set" {
            Set-QCredsForServer -svr "Server.core.local" | Should -BeTrue
        }
        It "Returns the credentials that are the set correctly" {
            $Creds = Set-QcredsForServer -svr "Server.core.local" 
            $Creds.UserName | Should -Be (Get-QCred core.local).UserName
        }
    }
}
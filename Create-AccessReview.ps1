Import-Module Microsoft.Graph.Identity.Governance
. .\Connect-Graph.ps1

param(
    [Parameter(Mandatory)]
    [string]$GroupId,

    [string]$Reviewers = "owners"
)

$settings = @{
    DisplayName = "Quarterly Access Review - $GroupId"
    Scope = @{
        query = "/groups/$GroupId"
        queryType = "MicrosoftGraph"
    }
    Reviewers = @(
        @{
            query = $Reviewers
            queryType = "MicrosoftGraph"
        }
    )
    Settings = @{
        mailNotificationsEnabled = $true
        recurrence = @{
            pattern = "quarterly"
        }
    }
}

Write-Host "Creating Access Review..." -ForegroundColor Cyan
New-MgIdentityGovernanceAccessReviewDefinition -BodyParameter $settings
Write-Host "Access Review created successfully." -ForegroundColor Green

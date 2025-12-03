<#
.SYNOPSIS
    Connects to Microsoft Graph with the required scopes.
#>

param(
    [string[]]$Scopes = @(
        "User.Read.All",
        "Group.ReadWrite.All",
        "Policy.ReadWrite.ConditionalAccess",
        "AccessReview.ReadWrite.All",
        "RoleManagement.Read.Directory",
        "EntitlementManagement.ReadWrite.All"
    )
)

Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Cyan

try {
    Connect-MgGraph -Scopes $Scopes -ErrorAction Stop
    Write-Host "Connected to Graph successfully." -ForegroundColor Green
}
catch {
    Write-Host "Failed to connect: $($_.Exception.Message)" -ForegroundColor Red
}

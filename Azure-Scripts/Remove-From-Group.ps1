# Parameters for script
param([String]$FilePath="C:\temp\Remove-Users-From-Group.csv", [String]$GroupObjectID="ENTER-GROUP-ID-HERE")
    
# Check if AzureAD module is installed and install if needed
if (-not (Get-Module -ListAvailable -Name AzureAD)) { Install-Module -Name AzureAD }

# Connect to dependencies
Connect-AzureAD

# For each user in file
Import-Csv $FilePath | ForEach-Object {

    $User = Get-AzureADUser -ObjectId $_.UPN
    Remove-AzureADGroupMember -ObjectId $GroupObjectID -MemberId $User.ObjectId
    Write-Host "Removed $($User.DisplayName) from group: $($GroupObjectID)"

}

# Disconnect from dependencies
Disconnect-AzureAD -Confirm:$false

# Complete
Write-Host "Script complete."


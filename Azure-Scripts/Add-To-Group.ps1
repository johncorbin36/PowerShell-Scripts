# Parameters for script
param([String]$FilePath="C:\temp\Add-Users-To-Group.csv", [String]$GroupObjectID="ENTER-GROUP-ID-HERE")

# Check if AzureAD module is installed and install if needed
if (-not (Get-Module -ListAvailable -Name AzureAD)) { Install-Module -Name AzureAD }

# Connect to dependencies
Connect-AzureAD

# For each user in file
Import-Csv $FilePath | ForEach-Object {

    $User = Get-AzureADUser -ObjectId $_.UPN
    Add-AzureADGroupMember -ObjectId $GroupObjectID -RefObjectId $User.ObjectID
    Write-Host "Added $($User.DisplayName) to group: $($GroupObjectID)"

}

# Disconnect from dependencies
Disconnect-AzureAD -Confirm:$false

# Complete
Write-Host "Script complete."

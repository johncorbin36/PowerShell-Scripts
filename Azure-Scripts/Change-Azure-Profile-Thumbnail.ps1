# Parameters for script
param([String]$FilePath="C:\Image-Location.jpg")

# Check if AzureAD module is installed and install if needed
if (-not (Get-Module -ListAvailable -Name AzureAD)) { Install-Module -Name AzureAD }

# Connect to dependencies
Connect-AzureAD

# For each Azure profile
foreach ( $User in $AzureUsers = Get-AzureADUser -All $True ) {

    # Set profile photo
    Set-AzureADUserThumbnailPhoto -ObjectId $User.ObjectId -FilePath $FilePath

}

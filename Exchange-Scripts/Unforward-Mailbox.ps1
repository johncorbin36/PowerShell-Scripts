# Parameters for script
param([String]$MailboxAddress='')

# Check if ExchangeOnlineManagement module is installed and install if needed
if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) { Install-Module -Name ExchangeOnlineManagement }

# Connect to script dependencies 
Connect-ExchangeOnline

# Get mailbox address if not defined
if ($MailboxAddress -eq '') { $MailboxAddress = Read-Host "Please enter the mailbox address you wish to unforward" }

# Unforwarded mailbox
Set-Mailbox -Identity $MailboxAddress -ForwardingAddress $null
Write-Host "Unforwarded $($MailboxAddress)."

# Disconnect from dependencies
Disconnect-ExchangeOnline -Confirm:$false

# Complete
Write-Host "Script complete."

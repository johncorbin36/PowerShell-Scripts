# Parameters for script
param([String]$MailboxAddress='', [String]$ForwardingAddress='')

# Check if ExchangeOnlineManagement module is installed and install if needed
if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) { Install-Module -Name ExchangeOnlineManagement }

# Connect to script dependencies 
Connect-ExchangeOnline

# Get variables if not defined
if ($MailboxAddress -eq '') { $MailboxAddress = Read-Host "Please enter the mailbox address" }
if ($ForwardingAddress -eq '') { $ForwardingAddress = Read-Host "Please enter the forwarding address" }

# Forward mailbox
Set-Mailbox -Identity $MailboxAddress -ForwardingAddress $ForwardingAddress
Write-Host "Forwarded $($MailboxAddress) to $($ForwardingAddress)."

# Disconnect from dependencies
Disconnect-ExchangeOnline -Confirm:$false

# Complete
Write-Host "Script complete."

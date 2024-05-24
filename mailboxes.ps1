# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Check if the ExchangeOnlineManagement module is installed
if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
    # Install the PowerShellGet module
    Install-Module -Name PowerShellGet -Force -AllowClobber
    # Install the ExchangeOnlineManagement module
    Install-Module -Name ExchangeOnlineManagement
}

# Import the ExchangeOnlineManagement module
Import-Module ExchangeOnlineManagement

# Define the user whose mailbox permissions you want to check
$UserMailbox = Read-Host -Prompt "Enter the username of the mailbox you want to check"

# Define the user you want to grant permissions to
#$UserToGrant = Read-Host -Prompt "Enter the UPN of the user you want to grant permissions to"

# Connect to Exchange Online
Connect-ExchangeOnline

# Get the Mailbox permissions for the specified user
$MailBoxPermissions = Get-ExoMailboxPermission -Identity $UserMailbox

# Output the mailbox permissions
$MailBoxPermissions

# Add read permission to the mailbox for the specified user
#Add-MailboxPermission -Identity $UserMailbox -User $UserToGrant -AccessRights ReadPermission

# Get the Mailbox permissions for the specified user again
#$MailBoxPermissionsAfter = Get-ExoMailboxPermission -Identity $UserMailbox

# Output the mailbox permissions after granting
$MailBoxPermissionsAfter

# Disconnect the session
Disconnect-ExchangeOnli
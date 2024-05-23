# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Define the user whose mailbox permissions you want to check
$UserMailbox = Read-Host -Prompt "Enter the username of the mailbox you want to check"

# Define the user you want to remove permissions from
$UserToRemove = Read-Host -Prompt "Enter the UPN of the user you want to remove permissions from"

# Connect to Exchange Online
Connect-ExchangeOnline

# Get the Mailbox permissions for the specified user
$MailBoxPermissions = Get-ExoMailboxPermission -Identity $UserMailbox

# Output the mailbox permissions
$MailBoxPermissions

# Try to remove read permission from the mailbox for the specified user
try {
    Remove-MailboxPermission -Identity $UserMailbox -User $UserToRemove -AccessRights ReadPermission -Confirm:$false
} catch {
    Write-Host "Failed to remove permission: $_"
}

# Get the Mailbox permissions for the specified user again
$MailBoxPermissionsAfter = Get-ExoMailboxPermission -Identity $UserMailbox

# Output the mailbox permissions after removing
$MailBoxPermissionsAfter

# Disconnect the session
Disconnect-ExchangeOnline
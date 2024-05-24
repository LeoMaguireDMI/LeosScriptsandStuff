# Import the necessary functions
. $PSScriptRoot/../src/Authentication/Public/Authenticate.ps1
. $PSScriptRoot/../src/MailboxPermissions/Public/Permissions.ps1

# Define the user whose mailbox permissions you want to check
$UserMailbox = Read-Host -Prompt "Enter the username of the mailbox you want to check"

# Connect to Exchange Online
Connect-Exchange

# Get and output the Mailbox permissions for the specified user
$MailBoxPermissions = Get-MailboxPermissions -UserMailbox $UserMailbox
$MailBoxPermissions

# Disconnect the session
Disconnect-Exchange
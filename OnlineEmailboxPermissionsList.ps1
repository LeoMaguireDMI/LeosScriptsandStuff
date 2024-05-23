# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Ask for the file name
$FileName = Read-Host -Prompt "Enter the file name"

# Read the file
$UserMailboxes = Get-Content $FileName

# Connect to Exchange Online
Connect-ExchangeOnline

# Cycle through each mailbox
foreach ($UserMailbox in $UserMailboxes) {
    # Get the Mailbox permissions for the specified user
    $MailBoxPermissions = Get-ExoMailboxPermission -Identity $UserMailbox

    # Output the mailbox permissions
    Write-Host "Permissions for ${UserMailbox}:"
    $MailBoxPermissions
}

# Disconnect the session
Disconnect-ExchangeOnline
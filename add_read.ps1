# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Ask for the file name
$FileName = Read-Host -Prompt "Enter the file name"

# Read the file
$UserMailboxes = Get-Content $FileName

# Define the user you want to grant permissions to
$UserToGrant = Read-Host -Prompt "Enter the UPN of the user you want to grant permissions to"

# Connect to Exchange Online
Connect-ExchangeOnline

# Cycle through each mailbox
foreach ($UserMailbox in $UserMailboxes) {
    # Get the Mailbox permissions for the specified user
    $MailBoxPermissions = Get-ExoMailboxPermission -Identity $UserMailbox

    # Output the mailbox permissions
    $MailBoxPermissions

    # Try to add read permission to the mailbox for the specified user
    try {
        Add-MailboxPermission -Identity $UserMailbox -User $UserToGrant -AccessRights ReadPermission
        Write-Host "Successfully added ReadPermission for $UserToGrant on $UserMailbox"
    } catch {
        Write-Host "Failed to add ReadPermission for ${UserToGrant} on ${UserMailbox}: $($_.Exception.Message)"
    }

    # Get the Mailbox permissions for the specified user again
    $MailBoxPermissionsAfter = Get-ExoMailboxPermission -Identity $UserMailbox

    # Output the mailbox permissions after granting
    $MailBoxPermissionsAfter
}

# Disconnect the session
Disconnect-ExchangeOnline
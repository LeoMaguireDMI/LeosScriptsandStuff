function Get-MailboxPermissions {
    param (
        [Parameter(Mandatory=$true)]
        [string]$UserMailbox
    )

    # Get the Mailbox permissions for the specified user
    Get-ExoMailboxPermission -Identity $UserMailbox
}
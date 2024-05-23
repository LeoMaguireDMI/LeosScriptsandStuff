# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Import required module
Import-Module ExchangeOnlineManagement

# Define the user whose mailbox you want to search
$UserMailbox = Read-Host -Prompt "Enter the username of the mailbox you want to search"

# Define the text you want to search for
$SearchQuery = Read-Host -Prompt "Enter the text you want to search for"

# Connect to Exchange Online
Connect-ExchangeOnline

# Log the search info
Write-Host "Searching mailbox $UserMailbox for text: $SearchQuery"

# Perform the search
try {
    $SearchResults = Search-Mailbox -Identity $UserMailbox -SearchQuery $SearchQuery -EstimateResultOnly

    # Log the search results
    Write-Host "Search completed. Estimated number of items that match the query: $($SearchResults.ResultItemsCount)"
} catch {
    Write-Host "Failed to search mailbox ${UserMailbox} for ${SearchQuery}: $($_.Exception.Message)"
}

# Disconnect the session
Disconnect-ExchangeOnline
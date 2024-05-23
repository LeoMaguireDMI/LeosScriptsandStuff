# Try to import the Active Directory module
Write-Host "Importing the Active Directory module..."
Try {
    Import-Module ActiveDirectory -ErrorAction Stop
}
Catch {
    Write-Host "Failed to import the Active Directory module. Please ensure it is installed."
    Exit
}

# Get the credentials
$Credential = Get-Credential -Message "Enter your AD admin credentials"

# Try to get all Exchange servers
Write-Host "Getting all Exchange servers..."
Try {
    $ExchangeServers = Get-ADComputer -Filter {Name -like "*EXCH*"} -Credential $Credential -ErrorAction Stop
}
Catch {
    Write-Host "Failed to get Exchange servers. Please ensure you have the necessary permissions."
    Exit
}

# Output the Exchange servers
Write-Host "Outputting the Exchange servers..."
$ExchangeServers
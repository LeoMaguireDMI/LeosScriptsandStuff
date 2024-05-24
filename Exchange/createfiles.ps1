# Define the base directory
$baseDir = "C:\Users\maguirl1\Documents\GitHub\LeosScriptsandStuff\Exchange"

# Define the files to create
$files = @(
    "src\Authentication\Public\Connect-ExchangeOnline.ps1",
    "src\Authentication\Public\Disconnect-ExchangeOnline.ps1",
    "src\Authentication\Authentication.psm1",
    "src\Logging\Public\Write-Log.ps1",
    "src\Logging\Logging.psm1",
    "src\MailboxPermissions\Public\Get-MailboxPermissions.ps1",
    "src\MailboxPermissions\MailboxPermissions.psm1"
)

# Create the files
foreach ($file in $files) {
    $fullPath = Join-Path -Path $baseDir -ChildPath $file
    New-Item -ItemType File -Force -Path $fullPath
}
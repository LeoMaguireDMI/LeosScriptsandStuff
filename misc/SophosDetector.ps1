$installPath = "C:\Program Files\Sophos\Endpoint Defense"
if (Test-Path $installPath) {
    Write-Output "Sophos is still installed."
    exit 1
} else {
    Write-Output "Sophos has been uninstalled."
    exit 0
}
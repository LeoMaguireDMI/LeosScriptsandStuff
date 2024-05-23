$installerPath = "C:\Program Files\Sophos\Endpoint Defense\Uninstall.exe"
$arguments = "/quiet"

if (Test-Path $installerPath) {
    Start-Process -FilePath $installerPath -ArgumentList $arguments -Wait
    Write-Output "Sophos uninstalled successfully."
} else {
    Write-Output "Sophos uninstaller not found."
}
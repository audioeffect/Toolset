#Introduction
Write-Host "-----------------------------------------------------------"
Write-Host " Shutdown-I.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Open Shutdown/Restart GUI..."
Write-Host "-----------------------------------------------------------"
Write-Host

#Process
$user = Read-Host "Enter admin username"
runas /user:carle.com\$user "shutdown -i"
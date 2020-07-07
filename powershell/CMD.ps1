#Introduction
Write-Host "-----------------------------------------------------------"
Write-Host " CMD.ps1 by Cole Tirpak - 03/06/2019"
Write-Host
Write-Host " Start Command Prompt as admin..."
Write-Host "-----------------------------------------------------------"
Write-Host

#Process
$user = Read-Host "Enter admin username"
runas /user:carle.com\$user "cmd.exe"
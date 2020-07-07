#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "--------------------------------------------------------------------------------"
Write-Host " AutoLogon.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Toggle AutoAdminLogon value on remote host (\\$computername)..."
Write-Host "--------------------------------------------------------------------------------"
Write-Host

#Process
$path = '.\batch'
$user=Read-Host Enter admin username
$cred=Get-Credential -Credential carle.com\$user
Start-Process -FilePath "$path\AutoLogon.cmd" -ArgumentList $computername -NoNewWindow -Credential $cred
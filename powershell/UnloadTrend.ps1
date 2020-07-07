#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "--------------------------------------------------------"
Write-Host " UnloadTrend.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Unload Trend Office Scan on remote host (\\$computername)..."
Write-Host "--------------------------------------------------------"
Write-Host

#Process
$user=Read-Host Enter admin username
$cred=Get-Credential -Credential carle.com\$user
$pass=$cred.GetNetworkCredential().Password
$path = '.\batch'
Start-Process -FilePath "$path\UnloadTrendRemote.cmd" -ArgumentList "$computername $user $pass" -Credential $cred
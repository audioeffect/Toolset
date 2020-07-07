#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-----------------------------------------------------------"
Write-Host " Tasks.ps1 by Cole Tirpak - 03/08/2019"
Write-Host
Write-Host " Run TaskList/TaskKill on remote host (\\$computername)..."
Write-Host "-----------------------------------------------------------"
Write-Host

#Process
$user=Read-Host Enter admin username
$cred=Get-Credential -Credential carle.com\$user
#$pass=$cred.GetNetworkCredential().Password
$path = '\\tsupport\tsupload\Cole\Toolset'
Start-Process -FilePath "$path\batch\Tasks.cmd" -ArgumentList "$computername $user $path" -Credential $cred
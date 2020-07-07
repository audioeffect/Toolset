#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "------------------------------------------"
Write-Host " NSLookup.ps1 by Cole Tirpak - 05/03/2018"
Write-Host
Write-Host " NSLookup of remote host (\\$computername)..."
Write-Host "------------------------------------------"
Write-Host

#Process
Resolve-DnsName $computername
#Write-Host 
#Write-Host -------------------------------------
#Write-Host 
#nslookup $computername

pause
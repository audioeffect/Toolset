#Pass computer parameter
Param
(
    $computername
)

$triggers=
    "{00000000-0000-0000-0000-000000000121}",
    "{00000000-0000-0000-0000-000000000003}",
    "{00000000-0000-0000-0000-000000000010}",
    "{00000000-0000-0000-0000-000000000001}",
    "{00000000-0000-0000-0000-000000000011}",
    "{00000000-0000-0000-0000-000000000021}",
    "{00000000-0000-0000-0000-000000000022}",
    "{00000000-0000-0000-0000-000000000002}",
    "{00000000-0000-0000-0000-000000000031}",
    "{00000000-0000-0000-0000-000000000114}",
    "{00000000-0000-0000-0000-000000000113}",
    "{00000000-0000-0000-0000-000000000026}",
    "{00000000-0000-0000-0000-000000000027}",
    "{00000000-0000-0000-0000-000000000032}"

$descriptions=
    "Application Deployment Evaluation Cycle",
    "Discovery Data Collection Cycle",
    "File Collection Cycle",
    "Hardware Inventory Cycle",
    "ID MIF Collection Cycle",
    "Machine Policy Retrieval Cycle",
    "Machine Policy Evaluation Cycle",
    "Software Inventory Cycle",
    "Software Metering Usage Report Cycle",
    "Software Updates Deployment Evaluation Cycle",
    "Software Updates Scan Cycle",
    "User Policy Retrieval Cycle",
    "User Policy Evaluation Cycle",
    "Windows Installer Source List Update Cycle"

function RunActions {
    $i = 0

    foreach($trigger in $triggers){ 
        Invoke-WMIMethod -Credential $cred  -ComputerName $computername -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule $trigger -ErrorVariable wmierror -ErrorAction SilentlyContinue | Out-Null

        if(!$wmierror) {
            Write-Host Scheduled $descriptions[$i]
        }
        else {
            Write-Host $descriptions[$i] failed
            Write-Host Reason: $wmierror
        }
        Write-Host

        $i++
    }

    $query = Read-Host -Prompt "Would you like to run actions again? (y/n)"
    Write-Host

    if($query -eq 'y'){
        RunActions
    }
}

#Introduction
Write-Host "---------------------------------------------------------"
Write-Host " Actions.ps1 by Cole Tirpak - 07/30/2019"
Write-Host
Write-Host " Run configuration actions on remote host (\\$computername)..."
Write-Host "---------------------------------------------------------"
Write-Host

#Process
$message = "Enter admin domain\username"
$cred = Get-Credential -Message $message

RunActions
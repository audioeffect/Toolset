@echo off
echo -------------------------------------
echo  Actions.cmd - 5/11/18 - Cole Tirpak
echo -------------------------------------
echo.

set wmi=C:\Windows\System32\wbem

%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000121}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000003}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000010}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000001}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000021}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000022}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000002}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000031}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000108}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000113}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000111}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000026}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000027}" /NOINTERACTIVE
start /wait timeout -t 1
%wmi%\WMIC.exe /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000032}" /NOINTERACTIVE

echo.

set /p prompt=Actions complete. Press ENTER to exit...
exit
:query
@echo off
cls
echo ------------------------------------------
echo  AutoLogon.cmd - 10/12/2018 - Cole Tirpak
echo ------------------------------------------
echo.

for /f "tokens=3-5" %%a in ('reg query "\\%1\HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon') do (
	set autolog=%%a
)

echo Current AutoAdminLogon value: %autolog%
echo.

set /p query=Would you like to toggle the value? (y/n): 
echo.

if %query%==n (
	echo Exiting...
	goto :quit
)

echo Changing value...
echo.

if %autolog%==1 (
	reg add "\\%1\HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v AutoAdminLogon /d 0
) else (
	reg add "\\%1\HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v AutoAdminLogon /d 1
)
echo.

timeout -t 2 > nul
cls
goto :query

:quit
timeout -t 2 > nul
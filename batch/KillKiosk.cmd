:start
@echo off
cls
echo.
echo ---------------------------------------
echo  KillKiosk.cmd - 7/13/18 - Cole Tirpak
echo ---------------------------------------
echo.

taskkill /s %1 /im kiosk.exe /f

echo Killing kiosk.exe...

timeout -t 3

echo %TAB%1. Kill again.
echo %TAB%2. Exit.
echo.

choice /c:12 /n /m "Enter your choice:"

if ERRORLEVEL 2 goto :end
if ERRORLEVEL 1 goto :start

:end
exit /b

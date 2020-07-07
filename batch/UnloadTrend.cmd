@echo off
echo ----------------------------------------
echo  UnloadTrend.cmd - 5/7/18 - Cole Tirpak
echo ----------------------------------------
echo.

set path="C:\Program Files (x86)\Trend Micro\OfficeScan Client"

echo Unloading Trend Micro Office Scan...
%path%\pccNTMon.exe -n Infect.Me
echo.

echo Allowing 1 minute for Trend to unload...
start /wait timeout -t 60
echo.

echo Task complete.
start /wait timeout -t 1
echo.

echo Exiting...
start /wait timeout -t 2
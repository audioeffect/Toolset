@echo off
setlocal enabledelayedexpansion

:step1
cls

echo ----------------------------------------
echo  CmRcService.cmd - 5/7/18 - Cole Tirpak
echo ----------------------------------------
echo.

echo Stopping service...
sc \\%1 stop CmRcService
echo.

timeout -t 5 > nul

echo Starting service...
sc \\%1 start CmRcService
echo.

set /p prompt=Retry (y/n)?: 
echo.

if "%prompt%"=="y" (
	goto :step1
) else (
	goto :step2
)

:step2
::exit
@echo off
cls
echo.
echo ------------------------------------------
echo  MapPrinters.cmd - 03/05/19 - Cole Tirpak
echo ------------------------------------------
echo.
set computername=%1
goto :map

pause

:map
echo Map printers for %computername%...

if not exist \\wframe99\maintain\printers\machines\%computername%.txt copy \\wframe99\maintain\printers\printers.txt \\wframe99\maintain\printers\machines\%computername%.txt

if not exist \\wframe99\maintain\printers\x64\machines\%computername%.txt copy \\wframe99\maintain\printers\x64printers.txt \\wframe99\maintain\printers\x64\machines\%computername%.txt

notepad \\wframe99\maintain\printers\machines\%computername%.txt
notepad \\wframe99\maintain\printers\x64\machines\%computername%.txt

cls

echo You have now created the %computername%.TXT files

set /p option=Would you like to map another computer (y/n)?: 

if "%option%"=="y" (
	set /p computername=Computer to map: 
	goto :map
) else (
	echo Exiting...
	goto :esc
)

:esc
timeout /t 2 >nul
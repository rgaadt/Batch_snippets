@echo off
tasklist /FI "IMAGENAME eq calc.exe" 2>NUL | find /I /N "calc.exe">NUL
for /f "delims=" %%i in ('TIME/t') do set "zeit=%%i"
for /f "delims=" %%i in ('date/t') do set "datum=%%i"
if "%ERRORLEVEL%"=="0" (
    echo >> c:\LOGS\log_4program.txt %datum% %zeit% - Program is running
) else (
echo >> c:\LOGS\log_4program.txt %datum% %zeit% -Program is not running
	start C:\Windows\System32\calc.exe
)
exit
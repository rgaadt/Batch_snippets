@echo off
sc query "Zabbix Agent" | find "RUNNING"
for /f "delims=" %%i in ('TIME/t') do set "zeit=%%i"
for /f "delims=" %%i in ('date/t') do set "datum=%%i"

if "%ERRORLEVEL%"=="0" (
    echo >> c:\LOGS\log_4_serivce.txt %datum% %zeit% - Service is running
) else (
    echo >> c:\LOGS\log_4_serivce.txt %datum% %zeit% - Service is not running
)
exit
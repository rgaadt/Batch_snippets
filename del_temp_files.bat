dir c:\users /b >%temp%\users.txt
for /f %%a in (%temp%\users.txt) do forfiles /p "c:\users\%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5" /d -7 /S /c "cmd /c del @file /s /q"
for /f %%a in (%temp%\users.txt) do forfiles /p "c:\users\%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5" /d -7 /S /c "cmd /c del @file /s /q"
for /f %%a in (%temp%\users.txt) do forfiles /p "c:\users\%%a\AppData\Local\\Temp" /d -7 /S /c "cmd /c del @file /s /q"
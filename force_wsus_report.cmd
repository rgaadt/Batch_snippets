@echo off
Echo This batch file will Force the Update Detection from the AU client: 
Echo 1. Stops the Automatic Updates Service (wuauserv)
Echo 2. Deletes the LastWaitTimeout registry key (if it exists) 
Echo 3. Deletes the DetectionStartTime registry key (if it exists) 
Echo 4. Deletes the NextDetectionTime registry key (if it exists)
Echo 5. Restart the Automatic Updates Service (wuauserv) 
Echo 6. Force the detection / reports to WSUS
ping 127.0.0.1 >NUL
net stop wuauserv
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v LastWaitTimeout /f
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v DetectionStartTime /f
Reg Delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v NextDetectionTime /f
net start wuauserv
wuauclt /resetauthorization
wuauclt /reportnow 
wuauclt /detectnow  
Echo This AU client will now check for the Updates on the Local WSUS Server.
ping 127.0.0.1 >NUL
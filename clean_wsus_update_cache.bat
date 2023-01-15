@echo off
net stop bits
net stop wuauserv
Ipconfig /flushdns
cd "Documents and Settings\All Users\Application Data\Microsoft\Network\Downloader"
del qmgr0.dat
del qmgr1.dat
cd C:\ProgramData\Microsoft\Network\Downloader
del qmgr0.dat
del qmgr1.dat
del /f /s /q %windir%\SoftwareDistribution\*.*
net start bits
net start wuauserv
wuauclt  /detectnow
wuauclt /reportnow
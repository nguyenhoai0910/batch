@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=Connect-vpnclient.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================================
echo "VPN start!!" >> %_log%
echo %_dateX%_%_timeX% >> %_log%
cd "C:\Program Files (x86)\Cisco Systems\VPN Client\" & start vpngui.exe
cmd.exe /c "C:\Program Files (x86)\Cisco Systems\VPN Client\vpnclient" disconnect
cmd.exe /c "C:\Program Files (x86)\Cisco Systems\VPN Client\vpnclient" connect VPN-SBV
REM start "C:\Program Files (x86)\SBV\CITAD Communication\CITAD Communication.exe"
timeout 15 && exit
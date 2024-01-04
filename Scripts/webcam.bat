@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=webcam.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
set _zip="C:\Program Files\7-Zip\7z.exe"
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateX%_%_timeX%.log

REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
ECHO ----%_namefile%_%_dateX%_%_timeX%---- >> %_log%
SET /P "action=Enter action (start|stop):
IF /I "%action%"=="start" (
%windir%\system32\pnputil /enum-devices > C:\Users\%username%\Desktop\list_device.txt >> %_log%
%windir%\system32\pnputil /disable-device "USB\VID_04F2&PID_B5ED&MI_00\6&33b62b15&0&0000" >> %_log%
%windir%\system32\pnputil /enable-device "USB\VID_04F2&PID_B5ED&MI_00\6&33b62b15&0&0000") >> %_log%
IF /I NOT "%action%"=="start" (
%windir%\system32\pnputil /disable-device "USB\VID_04F2&PID_B5ED&MI_00\6&33b62b15&0&0000")
type %_log%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%

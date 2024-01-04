@echo off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_BONew.bat
REM E:\BACKUP_LAPTOP\20230731\Quitrinh\batch\swift\ren_swift.bat
set _namefile=sleep.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
set _datetimeX=%_dateX%_%_timeX%
REM ======================================================
REM set _dateY=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
REM set _timeY=%TIME:~0,2%%TIME:~3,2%
REM set _dateY=%_dateY: =0%
REM set _timeY=%_timeY: =0%
REM set _datetimeY=%_dateY%_%_timeY%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_datetimeX%.log
REM ======================================================
SET _service=PanGPS
sc queryex "%_service%" >> %_log%
sc stop %_service% >> %_log%
timeout 5
REM Rundll32.exe user32.dll,LockWorkStation
%windir%\System32\rundll32.exe powrprof.dll,SetSuspendState 0,1,0 >> %_log%
REM sc start %_service%
REM timeout 4
REM sc start %_service%
timeout 2
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
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_datetimeX%.log
REM ======================================================
SET _service=PanGPS
sc queryex "%_service%" >> %_log%
sc stop %_service% >> %_log%
timeout 12 && exit
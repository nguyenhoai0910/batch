@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=autostart.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
echo %_dateX%_%_timeX% >> %_log%

%windir%\system32\inetsrv\appcmd list site >> %_log%
%windir%\system32\inetsrv\appcmd start site "api.sbv.ocb.vn"
%windir%\system32\inetsrv\appcmd start site "sbv.ocb.vn"
SET _service=ServiceRun
sc queryex %_service% >> %_log%
sc stop %_service%
sc start %_service%
timeout 4

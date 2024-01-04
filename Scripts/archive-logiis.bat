@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_BONew.bat
set _namefile=archive-logiis.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
set _mm=%DATE:~4,2%
set _mm=%_mm: =0%
if %_mm% LEQ 3 (set currentQtr=01-03) else if %_mm% LEQ 6 (set currentQtr=04-06) else if %_mm% LEQ 9 (set currentQtr=07-09) else if %_mm% LEQ 12 (set currentQtr=10-12)
echo %currentQtr% > %_log%
REM ======================================================
set _path_log=C:\inetpub\logs\LogFiles\Archived
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
if not exist %_path_log% mkdir %_path_log%
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
for %%i in (1,1,30) do ( echo %%i && %_7Zip% a -sdel "C:\inetpub\logs\LogFiles\Archived\archived_W3SVC%%i_%_dateX%.zip" C:\inetpub\logs\LogFiles\W3SVC%%i ) >> %_log%
type %_log%
pause
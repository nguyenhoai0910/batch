@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=check-quater-of-year-format.bat
REM set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
REM set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
REM set _dateX=%_dateX: =0%
REM set _timeX=%_timeX: =0%
REM echo %_dateX%_%_timeX%
REM ======================================================
set _dateY=%DATE:~6,4%%DATE:~0,2%%DATE:~3,2%
set _timeY=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateY=%_dateY: =0%
set _timeY=%_timeY: =0%
echo %_dateY%_%_timeY%
REM ======================================================
set _yyyy=%DATE:~6,4%
set _mm=%DATE:~0,2%
set _mm=%_mm: =0%
if %_mm% LEQ 3 (set _currentQtr=01-03) else if %_mm% LEQ 6 (set _currentQtr=04-06) else if %_mm% LEQ 9 (set _currentQtr=07-09) else if %_mm% LEQ 12 (set _currentQtr=10-12)
echo Quater of year: %_currentQtr% of %_yyyy% >> %_log%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_timeX%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_timeX%.log
set _path=C:\Users\%username%\Desktop\
REM ======================================================
for %_mm% in (01, 02, 03) do {
set _logscompress=W3SVC4
if not exist C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%\%_logscompress% mkdir C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%_%_logscompress%
ForFiles /P C:\inetpub\logs\LogFiles\%_logscompress% /S /D -92 /C "cmd /c {echo @file >> %_log%|move C:\inetpub\logs\LogFiles\%_logscompress%\@file C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%\%_logscompress%}"
%_7Zip% a -sdel C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%_%_logscompress%.7z C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%_%_logscompress%
}
ECHO --------------DONE-%_namefile%_%_dateY%_%_timeY%-------------- >> %_log%
type %_log%
timeout 10
@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=check-quater-of-year-format.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
REM ======================================================
set _dateY=%DATE:~6,4%%DATE:~0,2%%DATE:~3,2%
set _timeY=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateY=%_dateY: =0%
set _timeY=%_timeY: =0%
REM ======================================================
set _yyyy=%DATE:~10,4%
set _mm=%DATE:~4,2%
set _yyyy=%_yyyy: =0%
set _mm=%_mm: =0%
if %_mm% LEQ 3 (set _currentQtr=01-03) else if %_mm% LEQ 6 (set _currentQtr=04-06) else if %_mm% LEQ 9 (set _currentQtr=07-09) else if %_mm% LEQ 12 (set _currentQtr=10-12)
echo %_currentQtr% / %_yyyy%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_timeX%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_timeX%.log
REM ======================================================
echo Quater of year: %_currentQtr% of %_yyyy% >> %_log%
for %_mm% in (01, 02, 03) do {
set _logscompress=W3SVC4
if not exist C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%\%_logscompress% mkdir C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%\%_logscompress%
xcopy C:\inetpub\logs\LogFiles\%_logscompress% C:\inetpub\logs\LogCompress\%_yyyy%_%_currentQtr%\%_logscompress% 
ForFiles /P %_path% /S /D -30 /C "cmd /c {echo @file > .\log-delete.txt| del @file|echo done!}"


}
ECHO --------------DONE-%_namefile%_%_dateY%_%_timeY%-------------- >> %_log%
type %_log%
timeout 10
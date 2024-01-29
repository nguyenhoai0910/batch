@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=run.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
SET _http_code=""
SET _Url="https://scp.ocb.com.vn"
:loop
REM for /f %%i in ('curl -s -o /dev/nul -v -X POST -w %%{http_code} -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" %_Url%') do set _http_code=%%i
for /f %%i in ('curl -s -o /dev/nul -w %%{http_code} -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" %_Url%') do set _http_code=%%i
echo %_http_code%

if "%_http_code%" == "200" (
    timeout 10 && goto loop
) else (
	curl -s -o /dev/nul -v -X POST -w %%{http_code} -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" %_Url%' > %_log%
    REM call C:\Scripts\startSCP.bat
	timeout 20 && goto loop
)
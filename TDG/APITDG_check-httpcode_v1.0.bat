@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=web-tdg-check-httpcode.bat
:loop
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
echo %_namefile%_%_dateX%_%_timeX%
set _dir_temp=C:\Scripts-logs\temp
set _dir_ar=C:\Scripts-logs\archived
set _createdir=%_dir_temp% %_dir_ar%
(for %%a in (%_createdir%) do (if not exist %%a mkdir %%a ))
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\temp\%_namefile%.log
set _log_final=C:\Scripts-logs\%_namefile%.log
set _log_ar=C:\Scripts-logs\archived\%_namefile%_%_dateX%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateX%_%_timeX%.log
start cmd.exe /c "powershell.exe get-content %_log% -wait"
REM ======================================================
ECHO ------------------%_namefile%_%_dateX%_%_timeX%------------------ 
REM cmd /c " taskkill /IM "conhost.exe" /F "
echo %_namefile%_%_dateX%_%_timeX% ^| 200 > %_log%

REM TEST error
REM set _site00="http://10.96.23.230:8100/treasury-core"
REM for /f %%a in ( 'curl -k -s -o /dev/null -w "%%{http_code}" %_site00%' ) do set _http_code00=%%a 
REM echo %_site00% ^| %_http_code00% >> %_log%

REM local TDG
set _site01="https://tdg.ocb.com.vn/Images/20231205_hoainh/OCB-logo.png"
for /f %%a in ( 'curl -k -s -o /dev/null -w "%%{http_code}" %_site01%' ) do set _http_code01=%%a 
echo %_site01% ^| %_http_code01% >> %_log%

REM WEB OV Cty tu van gia
set _site02="http://10.105.0.66:80"
for /f %%a in ( 'curl -k -s -o /dev/null -w "%%{http_code}" %_site02%' ) do set _http_code02=%%a 
echo %_site02% ^| %_http_code02% >> %_log%

REM API TDG
set _site03="http://10.96.162.101/"
for /f %%a in ( 'curl -k -s -o /dev/null -w "%%{http_code}" %_site03%' ) do set _http_code03=%%a 
echo %_site03% ^| %_http_code03% >> %_log%

ECHO ====================================================================================
type %_log%
type %_log% > %_log_final%
if exist %_dir_ar% (
echo ------------------%_namefile%_%_dateX%_%_timeX%------------------ >> %_log_ar%
type %_log_final% >> %_log_ar%
)
del %_log%
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- 
type %_log%
timeout 3600 
goto loop 
REM exit
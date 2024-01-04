@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_PQTT.bat
set _namefile=rfc_PQTT.bat
set _datePQTT=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timePQTT=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _datePQTT=%_datePQTT: =0%
set _timePQTT=%_timePQTT: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%DATE:~10%%DATE:~4,2%%DATE:~7,2%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_datePQTT%_%_timePQTT%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 && EXIT)
SET _PATH0=C:\Website\_Backup\PhanQuyenTapTrung\%_datePQTT%-%_sub1%
SET _PATH1=C:\Users\%username%\Desktop\Trienkhai
SET _PATH5=C:\Website\PQTT
set _sub1=rfc
REM ======================================================
ECHO --------------%_namefile%_%_datePQTT%_%_timePQTT%-------------- >> %_log%
set _CreateDir=%_PATH0% %_PATH1% 
(for %%a in (%_CreateDir%) do (if not exist %%a mkdir %%a )) >> %_log%
if exist "C:\Users\%username%\Desktop\App phan quyen*.zip" ren "C:\Users\%username%\Desktop\App phan quyen*.zip" PQTT.zip >> %_log%
if exist "C:\Users\%username%\Desktop\PQTT.zip" "C:\Program Files\7-Zip\7z.exe" x -o"C:\Users\%username%\Desktop\Trienkhai\PQTT" "C:\Users\%username%\Desktop\PQTT.zip" >> %_logunzip%
DIR /B /A  /S C:\Users\%username%\Desktop\Trienkhai\PQTT > C:\Users\%username%\Desktop\Trienkhai\PQTT-%_sub1%.txt >> %_log%
xcopy C:\Website\PQTT C:\Website\_Backup\PhanQuyenTapTrung\%_datePQTT%-%_sub1%\ /E /H /C /I /Y /F >> %_log%
REM ECHO List IIS
%windir%\system32\inetsrv\appcmd list site >> %_log%
REM ECHO Stop IIS
%windir%\system32\inetsrv\appcmd stop site PQTT >> %_log%
REM REM Trienkhai
xcopy C:\Users\%username%\Desktop\Trienkhai\PQTT C:\Website\PQTT /E /H /C /I /Y /F >> %_log%
REM ECHO Start IIS
%windir%\system32\inetsrv\appcmd start site PQTT >> %_log%
type %_log%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_datePQTT%_%_timePQTT%-------------- >> %_log%

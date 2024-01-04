@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_BONew.bat
set _namefile=rfc_BONew.bat
set _dateBO=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeBO=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateBO=%_dateBO: =0%
set _timeBO=%_timeBO: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateBO%_%_timeBO%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateBO%_%_timeBO%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
SET _PATH0=C:\Website\_Backup\BONEW\%_dateBO%-%_sub1%
SET _PATH1=C:\Users\%username%\Desktop\Trienkhai
SET _PATH5=C:\Website\OCBBO
set _sub1=rfc
REM ======================================================
ECHO --------------%_namefile%_%_dateBO%_%_timeBO%-------------- >> %_log%
set _CreateDir=%_PATH0% %_PATH1% 
(for %%a in (%_CreateDir%) do (if not exist %%a mkdir %%a ))
if exist C:\Users\%username%\Desktop\Trienkhai mkdir C:\Users\%username%\Desktop\Trienkhai
if exist "C:\Users\%username%\Desktop\OCBBO.zip" "C:\Program Files\7-Zip\7z.exe" x -o"C:\Users\%username%\Desktop\Trienkhai\" "C:\Users\%username%\Desktop\OCBBO.zip" >> %_logunzip%
DIR /B /A  /S C:\Users\%username%\Desktop\Trienkhai\OCBBO > C:\Users\%username%\Desktop\Trienkhai\OCBBO-%_sub1%.txt
xcopy C:\Website\OCBBO C:\Website\_Backup\BONEW\%_dateBO%-%_sub1%\ /D /E /H /C /I /Y /F >> %_log%
REM ECHO List IIS
%windir%\system32\inetsrv\appcmd list site >> %_log%
REM ECHO Stop IIS
%windir%\system32\inetsrv\appcmd stop site "bo.ocb.vn" >> %_log%
REM REM Trienkhai
xcopy C:\Users\%username%\Desktop\Trienkhai\OCBBO C:\Website\OCBBO\ /D /E /H /C /I /Y /F  >> %_log%
REM ECHO Start IIS
%windir%\system32\inetsrv\appcmd start site "bo.ocb.vn"  >> %_log%
type %_log%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateBO%_%_timeBO%-------------- >> %_log%

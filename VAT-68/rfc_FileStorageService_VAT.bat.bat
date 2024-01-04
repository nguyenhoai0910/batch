@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_FileStorageService_VAT.bat
set _namefile=rfc_FileStorageService_VAT.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
set _logdir=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log.dir
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
if not exist C:\Users\%username%\Desktop\fs_service_release.zip echo "NOT source!, C:\Users\%username%\Desktop\fs_service_release.zip" & timeout 8 & EXIT
SET /P "qiz=Enter Excute (Y|N): "
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)

SET _PATH0=F:\Website\_Backup\FileStorageService_VAT\%_dateX%\fs_service_release
SET _PATH1=C:\Users\%username%\Desktop\fs_service_release
SET _PATH2=C:\Users\%username%\Desktop
SET _PATH5=F:\Website\FileStorageService_VAT\fs_service_release
if exist %_PATH0% SET _PATH0=F:\Website\_Backup\FileStorageService_VAT\%_dateX%_%_timeX%\fs_service_release
REM ======================================================
ECHO --------------%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%
set _CreateDir=%_PATH0%
(for %%a in (%_CreateDir%) do (if not exist %%a mkdir %%a ))
if exist "C:\Users\%username%\Desktop\fs_service_release.zip" "C:\Program Files\7-Zip\7z.exe" x -o%_PATH2% "C:\Users\%username%\Desktop\fs_service_release.zip" >> %_logunzip%
DIR /A-D /S %_PATH1% > %_logdir%
DIR /A-D /S %_PATH1% > C:\Users\%username%\Desktop\fs_service_release_%_dateX%_%_timeX%.txt

FOR %%x IN (module service) DO (IF EXIST %_PATH1%\%%x xcopy %_PATH5%\%%x %_PATH0%\%%x /D /E /H /C /I /Y /F) >> %_log%



SET /P "upz=Enter Upload (Y|N): "
IF /I NOT "%upz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
FOR %%x IN (module service) DO (IF EXIST %_PATH1%\%%x xcopy %_PATH1%\%%x %_PATH5%\%%x /D /E /H /C /I /Y /F) >> %_log%

type %_log%
if exist C:\Users\%username%\Desktop\fs_service_release REN %_PATH1% FileStorageService_VAT_%_dateX%_%_timeX%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%

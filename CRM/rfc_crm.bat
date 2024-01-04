@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_rfc_CRM.bat
set _namefile=rfc_CRM.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
set _logdir=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log.dir
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
if not exist C:\Users\%username%\Desktop\crm.zip echo "NOT source!, C:\Users\%username%\Desktop\crm.zip" & timeout 8 
SET /P "qiz=Enter Excute (Y|N): "
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
if not exist C:\Websites\_Backup\CRM mkdir C:\Websites\_Backup\CRM
SET _PATH0=C:\Websites\_Backup\CRM\%_dateX%
if exist %_PATH0% SET _PATH0=C:\Websites\_Backup\CRM\%_dateX%_%_timeX%
SET _PATH1=C:\Users\%username%\Desktop
SET _PATH2=C:\Users\%username%\Desktop\2.CRM_NodeJs
SET _PATH3=C:\Users\%username%\Desktop\3.SourceWeb
SET _PATH4=C:\CRMService
SET _PATH5=C:\Websites\CRM

REM ======================================================
ECHO --------------%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%
set _CreateDir=%_PATH0%
(for %%a in (%_CreateDir%) do (if not exist %%a mkdir %%a ))
if exist "C:\Users\%username%\Desktop\crm.zip" "C:\Program Files\7-Zip\7z.exe" x -o%_PATH1% "C:\Users\%username%\Desktop\crm.zip" >> %_logunzip%
DIR /A-D /S %_PATH1% > %_PATH0%\crm_%_dateX%_%_timeX%.txt
set _Dir=%_PATH2% %_PATH3% 
(for %%a in (%_Dir%) do (if exist %%a (echo %%a >> %_logdir% & DIR /A-D /S %%a >> %_logdir%)))
start cmd.exe /c "powershell.exe cat %_log% -wait"
REM ---------BACKUP---------
FOR %%x IN (CRMService) DO (IF EXIST %_PATH2%\%%x xcopy %_PATH4%\*.js %_PATH0%\%%x /E /H /C /I /Y /F) >> %_log%
FOR %%x IN (bin Content RptFiles Scripts Views) DO (IF EXIST %_PATH3%\%%x xcopy %_PATH5%\%%x %_PATH0%\%%x /E /H /C /I /Y /F) >> %_log%
REM ---------CONFIRM_GOLIVE---------
SET /P "upz=Enter Upload (Y|N): "
IF /I NOT "%upz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
REM ---------GOLIVE---------
FOR %%x IN (CRMService) DO (IF EXIST %_PATH2%\%%x xcopy %_PATH2%\%%x %_PATH4% /D /E /H /C /I /Y /F) >> %_log%
FOR %%x IN (bin Content RptFiles Scripts Views) DO (IF EXIST %_PATH3%\%%x xcopy %_PATH3%\%%x %_PATH5%\%%x /D /E /H /C /I /Y /F) >> %_log%
REM ---------SHOW_LOG_GOLIVE---------
type %_log%
if exist %_PATH2% REN %_PATH2% rfc_CRM_CRMService_%_dateX%_%_timeX%
if exist %_PATH3% REN %_PATH3% rfc_CRM_%_dateX%_%_timeX%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%

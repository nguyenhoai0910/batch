@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=DC_sync_DR.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
@set/a Yest=%DATE:~7,2%-1
if %Yest% LSS 10 (set Yest=0%Yest%)
echo %_dateX%_%_timeX%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
ECHO ----%_namefile%_%_dateX%_%_timeX%---- >> %_log%
REM ECHO PING FROM dr TO dc
REM set _n=10
REM set _host=10.96.192.10
REM REM Packets: Sent
REM FOR /F "tokens=3 delims=,= " %%a IN ('ping -n %_n% %_host% ^| findstr /R "^Packets: Sent =.$"') DO (
	REM echo %%a  
	REM if %%a EQU %_n% (
		REM echo Success && set _status=true
	REM ) 
	REM if %%a LSS %_n% (
		REM echo FAIL && set _status=false
	REM )
REM )
REM IF %_status%==false (echo Request time out!!! & timeout 5 & exit) >> %_log%
REM IF %_status%==true (
	REM SYNC
	pushd \\10.96.192.10\OMIT
	FOR %%x IN (API APIPUBLISH WEB WEBNEW) DO (ECHO %%x && xcopy %%x C:\OMIT\%%x /D /E /H /C /I /Y /F ) >> %_log%
	popd \\10.96.192.10\OMIT
REM )	
type %_log%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%

@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=DC_sync_DR-onboarding_customer.bat
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
ECHO PING FROM dr TO dc
set _n=10
set _host=10.88.90.68
REM Packets: Sent
FOR /F "tokens=3 delims=,= " %%a IN ('ping -n %_n% %_host% ^| findstr /R "^Packets: Sent =.$"') DO (
	echo %%a  
	if %%a EQU %_n% (
		echo Success && set _status=true
	) 
	if %%a LSS %_n% (
		echo FAIL && set _status=false
	)
)
IF %_status%==false (echo Request time out!!! & timeout 5 & exit) >> %_log%
IF %_status%==true (
	pushd \\10.88.90.68\f$
	xcopy trulyonline\onboarding_customer\%DATE:~10,4%\%DATE:~4,2%\%Yest% F:\trulyonline\onboarding_customer\%DATE:~10,4%\%DATE:~4,2%\%Yest% /E /H /C /I /Y /F >> %_log%
	popd \\10.88.90.68\f$
)	
type %_log%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%

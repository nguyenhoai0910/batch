@echo off
set _n=1
set _host=HCM-KCN-045
ping -n %_n% %_host% -4
FOR /F "tokens=4 delims= " %%a IN ('ping -n %_n% %_host% -4 ^| findstr /R "statistics"') DO (
	set _iptemp=%%a
)
	SET "_ip=%_iptemp::=%"
	echo ====================================================
	echo %_ip%
	
	
	
	REM ======check service ========
REM #CRM
REM if [ "$CRM" != "200" ];
REM then
	REM CRMS="FAILED"
	REM echo $CRMS
REM else
	REM CRMS="OK"  
REM fi	
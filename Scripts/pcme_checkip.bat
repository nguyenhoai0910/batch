@echo off
set _n=1
set _host=HCM-KCN-628
FOR /F "tokens=4 delims= " %%a IN ('ping -n %_n% %_host% -4 ^| findstr /R "statistics"') DO (
	set _iptemp=%%a
)
	SET "_ip=%_iptemp::=%"
	echo ====================================================
	echo %_ip%
	
	FOR /F "tokens=1 delims= " %%b IN ('type C:\Windows\System32\drivers\etc\hosts ^| findstr /R "pc.me"' ) DO (
	echo %%b
	set _iphost=%%b
	set "_left_str=%_iphost:~0,1%"
)	
	echo %_left_str%
	
	
pause
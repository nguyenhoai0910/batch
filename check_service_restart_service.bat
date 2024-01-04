@echo off
REM option: >> C:\Scripts-log\SCP.bat_%date:~10%%date:~4,2%%date:~7,2%.log
SET _Service=PanGPS
for /F "tokens=3 delims=: " %x in ('sc queryex "%_Service%"^|findstr "STATE"') do (  echo %x & if /I "%x" NEQ "RUNNING" 
	(
	sc start %_Service%
	echo %date%_%time% re-start !
	)
)
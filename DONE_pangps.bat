@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM Name: C:\Scripts\pangps.bat
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
REM ======================================================
sc queryex "PanGPS"
SET /P "_action=(stop|start|restart):
IF /I "%_action%"=="stop"
(
	netsh interface set interface "Ethernet" disable
	taskkill /f /im pangpa.exe
	sc stop PanGPS
)
IF /I "%_action%"=="start"
(
	netsh interface set interface "Ethernet" enable
	sc start PanGPS
	sc config PanGPS start=DEMAND
)
IF /I "%_action%"==""
(
	sc stop PanGPS
	sc start PanGPS
)
sc queryex "PanGPS"
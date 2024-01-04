@echo off
Rem connect T24 to laptop
rem net use Z: /user:OCB\soadmin2 OCB@123123 /delete
net use K: \\10.96.162.16\c$\T24Copy /user:OCB\soadmin2 SoOcb@29072022! /persistent:Yes

REM connect PC to laptop
rem net use Y: /delete
net use Y: \\10.160.7.95\e$ /persistent:Yes
goto eof


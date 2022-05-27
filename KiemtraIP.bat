@echo off
title "Internet Protocol IPV4"
:MENU
ECHO =======================================================
ECHO PICK YOUR OPTION:
ECHO 1. [ netsh interface ip show config name=? ]
ECHO 2. [ netsh int set int name=? admin=? ]
ECHO 3. [ netsh interface ipv4 show route ]
ECHO 4. [ netsh interface ip set address "name" dhcp ]
ECHO 5. [ netsh interface ip set address "name" static "ipaddr" "subnetmask" "gateway" "metric" ]
ECHO 6. [ netsh interface add route prefix="subnetmask" interface="name" nexthop="gateway" ]
ECHO 7. [ netsh interface ipv4 set dnsservers name="name"  source=static address="Dns1" validate=no ]
ECHO 8. [ Delete cache DNS - ipconfig /flushdns ]
ECHO 9. COMMAND LINE
ECHO 0. GOOD BYE!
ECHO =======================================================
ECHO.
SET INPUT=NOTHING
SET /P INPUT=CHOICE:
IF %INPUT%==0 goto 0
IF %INPUT%==1 goto 1
IF %INPUT%==2 GOTO 2
IF %INPUT%==3 GOTO 3
IF %INPUT%==4 GOTO 4
IF %INPUT%==5 GOTO 5
IF %INPUT%==6 GOTO 6
IF %INPUT%==7 GOTO 8
IF %INPUT%==8 GOTO 8
IF %INPUT%==9 GOTO 9

PAUSE
:0
CLS
pause
EXIT
:1
netsh int ipv4  show int
SET name=NOTHING
SET /P name=name:
IF %NAME%==ALL GOTO ALL

netsh interface ip show config name=%name%
ECHO.
goto menu
:ALL
netsh interface ip show config
ECHO.
goto menu
:2
CLS
ECHO Enable/disable a interface
netsh int ipv4 show int
SET NAME,ADMIN=NOTHING
SET /P NAME=NAME:
ECHO "ENABLED | DISABLED"
SET /P ADMIN=ADMIN:

netsh int set int name=%NAME% admin=%ADMIN%
netsh int ipv4  show int
ECHO.
goto menu
:3
netsh interface ipv4 show route
ECHO.
goto menu

:4
netsh int ipv4  show int
SET name=NOTHING
SET /P name=name:

netsh interface ip set address %name% dhcp
netsh interface ip show config name=%name%
ECHO.
goto menu

:5
netsh int ipv4  show int
SET name,ipaddr,subnetmask,gateway,metric=NOTHING
SET /P name=name:
SET /P ipaddr=ipaddr:
SET /P subnetmask=subnetmask:
SET /P gateway=gateway:
echo metric= 0 or 1
SET /P metric=metric:

netsh interface ip set address %name% static %ipaddr% %subnetmask% %gateway% %metric%
netsh interface ip show config name=%name%
ECHO.
goto menu
:6
netsh int ipv4  show int
SET name,ADDR=NOTHING
SET /P name=name:
SET /P SUBNETMASK=SUBNETMASK:
SET /P GATEWAY=GATEWAY:
netsh interface add route prefix=%SUBNETMASK% interface=%NAME% nexthop=%GATEWAY%
ECHO.
goto menu
:7
ECHO "OBTAIN DNS SERVER | PREFERRED DNS Server | ALTERNATE DNS SERVER"
SET INPUT=NOTHING
SET /P INPUT=CALOGATE:

IF %INPUT%==OBTAIN GOTO OBTAIN
IF %INPUT%==PREFERRED GOTO PREFERRED
IF %INPUT%==ALTERNATE GOTO ALTERNATE

:OBTAIN
ECHO OBTAIN DNS SERVER
netsh int ipv4  show int
SET name=NOTHING
SET /P name=name:
netsh interface ipv4 set address name=%NAME% source=dhcp
ECHO.
goto menu
:PREFERRED
ECHO PREFERRED DNS SERVER
netsh int ipv4  show int
SET name,ADDR=NOTHING
SET /P name=name:
SET /P ADDR=ADDR:
netsh interface ipv4 set dnsservers name=%NAME%  source=static address=%ADDR% validate=no
ECHO.
goto menu
:ALTERNATE
ECHO ALTERNATE DNS SERVER
netsh int ipv4  show int
SET name,ADDR=NOTHING
SET /P name=name:
SET /P ADDR=ADDR:
netsh interface ipv4 add dnsservers name=%NAME% address=%ADDR% validate=no index=2
ECHO.
goto menu
:8
ipconfig /flushdns
ECHO.
goto menu
:9
CMD
ECHO.
goto menu

pause
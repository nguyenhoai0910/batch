@ECHO OFF
TITLE Check IP
CLS
COLOR 06
:1
REM Show all network interfaces and its link state
REM netsh interface show interface
netsh int show int

REM Show IP all interface
REM netsh interface ipv4 show address
netsh int ipv4 show address

REM Show IP a interface
REM netsh interface show interface name=Wi-fi
netsh int ipv4 show address name=Wi-fi

REM Show global TCP/IP Parameters
REM netsh interface ipv4 show global
netsh int ipv4 show global

REM Disable and enable a Interface
REM netsh int set int name="ethernet" admin=disabled/enabled
netsh int set int "Wi-fi" admin=disabled
netsh int set int "Wi-fi" admin=enabled

REM Print the routing table
REM netsh interface ipv4 show route
netsh int ipv4 show route

REM Show all tcp connections
REM netsh interface ipv4 show tcpconnections
netsh int ipv4 show tcpconnections

REM Show dynamic portrange for outgoing connections
REM netsh interface ipv4 show dynamicportrange protocol=tcp
netsh int ipv4 show dynamicportrange protocol=tcp

REM Set a static IP Address (persistent/active(temporary))
REM netsh interface ipv4 set address name="Local Area Connection 2" static 172.16.254.2 255.255.255.192 172.16.254.1 store=persistent
netsh int ipv4 set address "Wi-fi" static 172.16.254.2 255.255.255.192 172.16.254.1 store=persistent

REM Set a static DNS
REM netsh interface ipv4 set dnsservers name="Local Area Connection 2"  source=static address="172.16.254.250" validate=no
netsh int ipv4 set dns "Wi-fi" static 172.16.254.250 validate=no






:2
REM 
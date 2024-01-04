@echo off
cmd.exe /k "start ping 192.168.92.18 -n 10 && exit"
cmd.exe /k "start ftp 192.168.92.18 && exit"
cmd.exe /k "start telnet 192.168.92.18 21 && exit"
cmd.exe /k "start ping 135.50.1.26 -n 10 && exit"
cmd.exe /k "start telnet 135.50.1.26 2000 && exit"
cmd.exe /k "start ping 135.5.1.26 -n 10 && exit"
cmd.exe /k "start telnet 135.5.1.26 2000 && exit"
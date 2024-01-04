@echo off
net use H: /delete /y
net use H: \\10.97.26.105\20220607 /user:crm 092020SO!23Asd** /persistent:Yes

timeout 10 > nul

set today=%date:~6,4%%date:~3,2%%date:~0,2%
path="C:\BackupDienPCI"
H:
cd H:\
mkdir %today%
C:
cd %path%
mkdir %today%
Z:
cd Z:\
mkdir BKTEMP
pause 
goto eof
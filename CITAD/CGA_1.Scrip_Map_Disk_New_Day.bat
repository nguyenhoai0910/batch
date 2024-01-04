@echo off

set CurrentDate=%date:~10%%date:~4,2%%date:~7,2%

mkdir C:\DienPCIBackup\%CurrentDate%

net use H: /delete /y
net use H: \\10.98.42.41\citad /user:citaduser abc@123! /persistent:Yes
mkdir H:\%CurrentDate%

net use W: /delete /y 
net use W: \\10.96.142.115\cid.bnk.in /user:swt.bnk swt.bnk /persistent:Yes
net use Z: /delete /y
net use Z: \\10.96.142.115\cid.bnk.out.2\%CurrentDate% /user:swt.bnk swt.bnk /persistent:Yes


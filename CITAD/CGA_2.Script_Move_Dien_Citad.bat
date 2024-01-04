@echo off
set CurrentDate=%date:~10%%date:~4,2%%date:~7,2%
xcopy H:\%CurrentDate%\*.* C:\DienPCIBackup\%CurrentDate%
MOVE /y H:\%CurrentDate%\*.* Z:\



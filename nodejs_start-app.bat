@echo off
Rem des: create task scheduler run script auto start service app.js
set date="%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%"
C:
if not exist "C:\logs\%date%" mkdir "C:\logs\%date%"
cd C:\App
pm2 start app.js
pm2 status 0 > C:\logs\%date%

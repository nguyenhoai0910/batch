@echo off
if not exist %cd%\hoainh mkdir hoainh
if not exist %cd%\hoainh\input.txt echo. 2>%cd%\hoainh\input.txt
FOR /F "tokens=* delims=" %%x in (%cd%\input.txt) DO echo %cd%
pause
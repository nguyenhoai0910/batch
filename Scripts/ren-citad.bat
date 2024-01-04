@echo off
set path=C:\Users\%username%\Desktop\CITAD\
set path1=%path%\Source
set path2=%path%\Des
if exist %path2% del %path2%\
if not exist %path% mkdir %path%
if not exist %path1% mkdir %path1%
if not exist %path2% mkdir %path2%
if not exist %path%\input.txt echo. 2> %path%\input.txt & echo #GAWITF20220412.111501>%path%\input.txt
FOR /F "tokens=* delims=" %%x in (%path%\input.txt) DO (copy %path1%\%%x.old "%path2%")
FOR /F "tokens=* delims=" %%x in (%path%\input.txt) DO (ren %path2%\%%x.old "%%x")
pause
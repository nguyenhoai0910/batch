@echo off
set path=.\CITAD
set path1=%path%\Source
set path2=%path%\Des
if not exist %path% mkdir %path%
if not exist %path1% mkdir %path1%
if not exist %path2% mkdir %path2%
if not exist %path%\input.txt echo. 2> %path%\input.txt & echo #GAWITF20220412.111501>%path%\input.txt
set /p first=first: 
set /p last=last: 
set len=8
FOR /l %%N in (%first%, 1, %last%) do (
    setlocal EnableDelayedExpansion
	set "n=0000000000000%%N"
    set "padded=!n:~-%len%!
    echo '!padded!',>>%path%\number.txt
)
pause
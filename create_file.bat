@echo off
REM create file %%a content %%b
setlocal enabledelayedexpansion
cd .
if not exist MyList.txt echo. 2> MyList.txt
if not exist test mkdir test
FOR /F "tokens=1-2 delims=," %%a in (MyList.txt) DO (
    set /a count+=1
    echo %%b >.\test\!count!_%%a.txt 
)
endlocal
pause
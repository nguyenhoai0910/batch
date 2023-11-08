# Save lib or function batch script.
## 1. Yesterday
description: yesterday in excute day.
```batch
@ECHO off
@set a=1
@set b=10
@set/a Yest=%date:~3,2%-%a%
if %Yest% LSS %b% (set Yest=0%Yest%)
set Yesterday=%date:~6,4%%date:~0,2%%Yest%
echo %Yesterday%
```

## 2. Quater-of-year
```batch
@ECHO off
set _yyyy=%DATE:~6,4%
set _mm=%DATE:~0,2%
set _mm=%_mm: =0%
if %_mm% LEQ 3 (set _currentQtr=01-03) else if %_mm% LEQ 6 (set _currentQtr=04-06) else if %_mm% LEQ 9 (set _currentQtr=07-09) else if %_mm% LEQ 12 (set _currentQtr=10-12)
echo Quater of year: %_currentQtr% of %_yyyy%
```
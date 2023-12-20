# Save lib or function batch script.
## 1. Yesterday
description: yesterday in excute day.
```batch
REM Version X
@set a=1
@set b=10
@set/a YestX=%DATE:~7,2%-%a%
if %YestX% LSS %b% (set Yest=0%Yest%)
set _YesterdayX=%DATE:~10,4%%DATE:~4,2%%YestX%
echo %_YesterdayX%
```
```batch
REM Version Y
@set a=1
@set b=10
@set/a YestY=%date:~3,2%-%a%
if %YestY% LSS %b% (set Yest=0%Yest%)
set _YesterdayY=%date:~6,4%%date:~0,2%%YestY%
echo %_YesterdayY%
```

## 2. Quater-of-year
```batch
@ECHO off
set _yyyy=%DATE:~10,4%
set _mm=%DATE:~4,2%
set _mm=%_mm: =0%
if %_mm% LEQ 3 (set _currentQtrdetail=01-03) else if %_mm% LEQ 6 (set _currentQtrdetail=04-06) else if %_mm% LEQ 9 (set _currentQtrdetail=07-09) else if %_mm% LEQ 12 (set _currentQtrdetail=10-12)
if %_mm% LEQ 3 (set _currentQtr=01) else if %_mm% LEQ 6 (set _currentQtr=02) else if %_mm% LEQ 9 (set _currentQtr=03) else if %_mm% LEQ 12 (set _currentQtr=04)
echo Quater of year: %_currentQtr% of %_yyyy% (%_currentQtrdetail%/%_yyyy%)
```

## 3. Show All site IIS
```batch
To list your sites out:
%windir%\system32\inetsrv\appcmd list site

appcmd start site /site.name:string
appcmd stop site /site.name:string

From <https://serverfault.com/questions/319725/how-do-i-restart-a-single-website-in-iis7-using-commandline
```
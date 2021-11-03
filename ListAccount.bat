@echo off
title List Account
CLS
COLOR 06
:No
set "choose=;1,2,3;exit;"
set account=
set name=
set passwd=
set menu=
set pathfile="D:\NguyenHoai\MyDocuments\####"
CLS
echo.
echo 1. Tao thong tin.
echo 2. Xem thong tin.
echo 3. Exit.
set /p choose=Choose:	
echo.
if %choose%==1 goto Yes.input
if %choose%==2 goto Yes.show
for %%A in (3 exit) do if %choose%==%%A goto exit
goto No
:Yes.input
CLS
echo 1. Tao thong tin.
echo Moi ban nhap thong tin tai khoan
echo =================================
set /p account=Nhap ten chuong trinh cua tai khoan:	
set /p name=Ten dang nhap:	
set /p passwd=Password:	
echo.
echo *Type="%account%"	Ten dang nhap="%name%"	Password="%passwd%"
set /p menu=Do you want to save?	(Y/N)	
for %%B in ("y" "Y") do if %menu%==%%B goto Yes.save
for %%C in ("n" "N") do if %menu%==%%C goto No
:Yes.save
echo.
echo *Type="%account%"	Ten dang nhap="%name%"	Password="%passwd%">> %pathfile%
goto No
:Yes.show
CLS
echo 2. Xem thong tin.
more %pathfile%
pause>nul
goto No

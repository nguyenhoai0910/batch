ECHO OFF
rem ECHO ON/OFF --> mo/tat hien thi cac dong lenh thuc thi
CLS
CALL wellcome.bat
CLS
COLOR 03
rem COLOR 03 --> hien thi mau 03 cho cac dong lenh thuc thi
TITLE EXAMPLE
rem TITLE EXAMPLE --> hien thi tieu de file bat
ECHO.
rem ECHO. --> cho ra mot dong trong
ECHO File Batch duoc xem la thanh phan khong the thieu cua HDH.
rem ECHO File Batch duoc xem... --> hien thi noi dung sau lenh echo
ECHO.
Echo Hy vong bai viet se co ich voi cac ban.
ECHO.
ECHO http://vnnewbies.com
ECHO.
PAUSE
CLS
rem PAUSE --> tam nghi, chung trinh tiep tuc khi nhan phim bat ki
TITLE Thong tin tac gia
rem TITLE EXAMPLE --> hien thi tieu de file bat
ECHO.
ECHO Ten:			Nguyen Huu Hoai
ECHO Ma sinh vien:		2117220015
ECHO Lop:			CCQ1722A
ECHO Khoa:			CNTT
ECHO Truong:			Cao dang Cong Thuong TP Ho Chi Minh
ECHO.
ECHO.
ECHO 							%date% - %time%
PAUSE
CLS
CALL goodbye.bat
rem CALL README.CMD --> goi mot file khac khong ket thuc file *.bat dang chay; cmd ->call *.cmd or bat -> call *.bat
exit


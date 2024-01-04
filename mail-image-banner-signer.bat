REN C:\Users\Soadmin2\Desktop\*.jpg Chan-chu-ky.jpg

SET /P "qiz=Enter upload banner signature file (Y|N):
IF %qiz%==N goto:eof

PUSHD \\10.102.20.10\D$
REN Website\website-public\dist\ocb-fe\browser\Uploads\ref\emailbanner\Chan-chu-ky.jpg Chan-chu-ky_%date:~10%%date:~4,2%%date:~7,2%.jpg
COPY C:\Users\Soadmin2\Desktop\Chan-chu-ky.jpg Website\website-public\dist\ocb-fe\browser\Uploads\ref\emailbanner\
POPD \\10.102.20.10\D$
PUSHD \\10.102.84.10\D$
REN Website\website-public\dist\ocb-fe\browser\Uploads\ref\emailbanner\Chan-chu-ky.jpg Chan-chu-ky_%date:~10%%date:~4,2%%date:~7,2%.jpg
COPY C:\Users\Soadmin2\Desktop\Chan-chu-ky.jpg Website\website-public\dist\ocb-fe\browser\Uploads\ref\emailbanner\
POPD \\10.102.84.10\D$
ECHO DONE!!!
PAUSE
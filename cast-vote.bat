@echo off   
@REM start cmd /k Call start-webdriver.bat

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%-%date:~4,2%%date:~7,2%_0%time:~1,1%-%time:~3,2%-%time:~6,2% 
SET dtStamp24=%date:~-4%-%date:~4,2%%date:~7,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

ECHO %date% %time%
ECHO %dtStamp%

SET filename=C:\ravib\r\auto-vote\logs\log_%dtStamp%.log 2>&1
set filename=%filename: =%
echo %filename%
protractor C:\ravib\r\auto-vote\conf.js > %filename%

goto :eof

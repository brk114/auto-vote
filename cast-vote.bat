@ECHO OFF   

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%-%date:~4,2%%date:~0,2%_0%time:~1,1%-%time:~3,2%-%time:~6,2% 
SET dtStamp24=%date:~-4%-%date:~4,2%%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%

IF "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) ELSE (SET dtStamp=%dtStamp24%)

ECHO %date% %time%
:: ECHO %dtStamp%

:: SET filename=%ABS_PATH%\logs\log_%dtStamp%.log 2>&1
:: SET filename=%filename: =%
:: ECHO %filename%

protractor %ABS_PATH%\conf.js 
::protractor %ABS_PATH%\conf.js > %filename%
ECHO Voting completed at: %date% %time%
GOTO :EOF

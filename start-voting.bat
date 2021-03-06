@echo off

set REL_PATH=.
set ABS_PATH=

rem // Save current directory and change to target directory
pushd %REL_PATH%

rem // Save value of CD variable (current directory)
set ABS_PATH=%CD%

rem // Restore original directory
popd

echo Relative path: %REL_PATH%
echo Maps to path: %ABS_PATH%

set "arg1=%1"
IF "%arg1%"=="" set "arg1=0"

echo Initial Delay(in minutes): %arg1%
:: The number along with AutoVote.exe is initial delay(in minutes) to start the job, 
:: The job will execute every 30.5 minutes
SET SLN_PATH=%ABS_PATH%\AutoVoteScheduler
SET SCHEDULER_EXE_PATH="%SLN_PATH%\AutoVote\bin\Debug\netcoreapp3.1"

ECHO Checking scheduler exe path at %SCHEDULER_EXE_PATH%
IF NOT EXIST "%SCHEDULER_EXE_PATH%\AutoVote.exe" (
    dotnet build %SLN_PATH%
)

:: starting web driver
@REM start cmd /k Call start-webdriver.bat
:: starting the auto vote scheduler
%SCHEDULER_EXE_PATH%\AutoVote.exe %ABS_PATH%\cast-vote.bat %arg1%

@REM Open browser with another configured profile
@REM "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" --user-data-dir=C:\Users\ravib\AppData\Local\BraveSoftware\Brave-Browser\Protractor
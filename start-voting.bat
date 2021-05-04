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
IF NOT EXIST "%ABS_PATH%\AutoVoteScheduler_Code\AutoVote\bin\Debug\netcoreapp3.1\AutoVote.exe" (
    dotnet build %ABS_PATH%\AutoVoteScheduler_Code\AutoVote
)

:: starting web driver
start cmd /k Call start-webdriver.bat
:: starting the auto vote scheduler
%ABS_PATH%\AutoVoteScheduler_Code\AutoVote\bin\Debug\netcoreapp3.1\AutoVote.exe %ABS_PATH%\cast-vote.bat %arg1%
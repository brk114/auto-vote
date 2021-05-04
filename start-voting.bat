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
echo Maps to path: %ABS_PATH%\cast-vote.bat

set "arg1=%1"
IF "%arg1%"=="" set "arg1=0"

echo Initial Delay(in minutes): %arg1%
:: The number along with AutoVote.exe is initial delay(in minutes) to start the job, 
:: The job will execute every 30.5 minutes
%ABS_PATH%\vote-sheduler\AutoVote.exe %ABS_PATH%\cast-vote.bat %arg1%
# Auto-vote Scheduler

Auto schedule voting code is here,
go though install.bat and install dependencies first,
then start the voting using by running the file `start-voting.bat`

## Installation

1. Install the Java runtime. Download link [here](https://java-runtime-environment.en.softonic.com/download).
2. Install the NodeJS latest LTS runtime. Download link [here](https://nodejs.org/en/download/).
3. Install the dotnet core 3.1 runtime. Download link [here](https://dotnet.microsoft.com/download/dotnet/thank-you/runtime-aspnetcore-3.1.14-windows-x64-installer).
4. Then install the protractor from commands in `install.bat`.
5. Update the web driver from commands in `install.bat`.

## Running the scheduler

1. Start the scheduler by running the `start-voting.bat`, this will also starts the web driver by running the `start-webdriver.bat` in another terminal window.

Note: Make sure the webdriver is not running before starting the vote scheduler.

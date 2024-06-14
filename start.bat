@echo off

REM Check if Python is installed
where python >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed.
    pause
    exit /b
)

REM Install dependencies
pip install selenium

REM Goto bot folder
cd bot

REM Run the Python script
python send.py

REM Keep the command prompt open
cmd /k
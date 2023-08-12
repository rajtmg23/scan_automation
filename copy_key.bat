@echo off
set "sourceFile=key.txt"
set "targetDirectory=c:\Scan\Soft"

REM Create target directory if it doesn't exist
if not exist "%targetDirectory%" (
    mkdir "%targetDirectory%"
)

REM Copy source file to target directory
copy "%sourceFile%" "%targetDirectory%" > nul
if errorlevel 1 (
    echo Error: Unable to copy %sourceFile% to %targetDirectory%
    exit /b 1
)

REM Set attributes for target directory and files
attrib +h +s "%targetDirectory%" > nul
attrib +h +s "%targetDirectory%\%sourceFile%" > nul

if errorlevel 1 (
    echo Warning: Unable to set attributes for %targetDirectory% or %sourceFile%
)

echo Key copied successfully.

pause

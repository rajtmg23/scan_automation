@echo off
echo Copying necessary files.......

set "targetDirectory=C:\Program Files (x86)\Scan"
set "source_folder=%~dp0naps2"

REM Create target directory if it doesn't exist
if not exist "%targetDirectory%" (
    mkdir "%targetDirectory%"
)

REM Copy each source file to target directory
copy "%~dp0controls.ini" "%targetDirectory%"
copy "%~dp0app_v2.exe" "%targetDirectory%"
xcopy /E /I /Y "%source_folder%" "%targetDirectory%\naps2"

echo Files copied successfully.

pause

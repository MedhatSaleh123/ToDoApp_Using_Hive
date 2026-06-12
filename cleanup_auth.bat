@echo off
REM Cleanup script to remove auth feature
REM This script deletes the entire auth folder from the features directory

echo Removing auth feature...

REM Delete the auth folder and all its contents
rmdir /s /q "lib\features\auth"

echo Auth feature removed successfully!
echo The app is now ready to run with only the Todo feature.
pause

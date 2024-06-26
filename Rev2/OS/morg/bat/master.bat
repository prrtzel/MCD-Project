@echo off
start /b "" morgbin.bat
start /b /w "" save.bat
start /b deploy.bat
start /b /w "" openfile.bat
cd ..
exit /b
@echo off
powershell -nop -c "& {sleep -m 10}"
wscript "save.vbs"
taskkill /f /im easybin.exe
exit
@echo off
set filep=%cd%\%1
set filep=%filep:"=%
set filep="%filep%"

if [%1]==[] (
	goto :eof
)

if exist %filep% (
	start "" "C:\Program Files (x86)\Notepad++\notepad++.exe" %filep%
) else (
	start "" "C:\Program Files (x86)\Notepad++\notepad++.exe" "%1"
)


:eof
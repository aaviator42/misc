:: notepad++ launcher
:: invoke as 'npp' or as 'npp filename'
:: by aaviator42
:: 2022-08-15

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
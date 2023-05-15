:: notepad launcher
:: invoke as 'np' or as 'np filename'
:: by aaviator42
:: 2022-08-15

@echo off

if [%1]==[] (
	start notepad
) else (
	start notepad %1
)
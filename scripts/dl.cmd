:: Download a file.
:: dl [URL] [output-file]
:: aaviator42
:: 2022-05-02

@echo off
if [%1]==[] (
	goto :eof
)

if [%2]==[] (
	goto :eof
)

echo Downloading...
echo URL : %1
echo File: %2
echo:
curl --connect-timeout 100 -C - --retry 10 --retry-all-errors --retry-delay 5 -o %2 %1
echo:

if %errorlevel% == 0 (
	echo Done!
) else (
	echo Error!
)

:eof

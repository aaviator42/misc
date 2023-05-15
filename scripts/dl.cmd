:: Download a file.
:: dl <URL> [output-file]
:: aaviator42
:: 2022-05-02

@echo off
if [%1]==[] (
	goto :eof
)


echo:
echo Downloading...
echo URL : %1
echo File: %2
echo:

if [%2]==[] (
	curl --connect-timeout 100 --retry 100 --retry-all-errors --retry-delay 5 --remote-name --remote-header-name -C - %1
) else (
	curl --connect-timeout 100 --retry 100 --retry-all-errors --retry-delay 5 -C - -o %2 %1
)


echo:

if %errorlevel% == 0 (
	echo Done!
) else (
	echo Error!
)

:eof
@echo off

REM request repeater 
REM v1.0, 2024-09-28
REM by @aaviator42
REM USAGE:
REM 
REM  > reqrep 5 https://example.com
REM 
REM  This will make 5 requests to https://example.com 
REM  and display the HTTP response code after each request.


setlocal

if "%1"=="" (
    echo Error: Please provide the count as the first argument.
    goto :eof
)

if "%2"=="" (
    echo Error: Please provide the URL as the second argument.
    goto :eof
)

set count=%1
set url=%2

for /l %%i in (1, 1, %count%) do (
    echo Request %%i:
	REM the following suppresses page output
    REM curl -s -o nul -w "HTTP Response Code: %%{http_code}\n" %url%
    curl -s -w "HTTP Response Code: %%{http_code}\n" %url%
)

endlocal

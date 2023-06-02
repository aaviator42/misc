:: loadtest2.cmd
:: by @aaviator42
:: License: AGPLv3
:: 2023-06-02

@echo off
setlocal

REM Modify the following variables according to your needs
set "URL=http://example.com"
set "BATCHES=40"
set "REQUESTS_PER_BATCH=40"
set "TIMEOUT=0"

set /a "TOTAL_REQUESTS=BATCHES * REQUESTS_PER_BATCH"

echo loadtest2.cmd
echo ---------------------------
echo Target: %URL%
echo Number of batches: %BATCHES%
echo Wait between batches: %TIMEOUT% seconds
echo Requests per batch: %REQUESTS_PER_BATCH%
echo Total number of requests: %TOTAL_REQUESTS%
echo:
echo Running...
REM Loop to execute multiple batches of requests
for /L %%j in (1,1,%BATCHES%) do (
  echo Batch %%j/%BATCHES%
  call :make_requests
  timeout /t %TIMEOUT% >nul
)
echo Done!
echo:
pause

exit /b

REM Function to make concurrent requests using curl
:make_requests
for /L %%i in (1,1,%REQUESTS_PER_BATCH%) do (
  start /b curl -s %URL% >nul 2>nul
)
exit /b


endlocal

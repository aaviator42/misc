:: rename all files in folder consecutively from 1.ext to n.ext
:: while preserving original file extensions

:: 2023-05-15
:: aaviator42

@echo off
setlocal enabledelayedexpansion
set counter=1
for %%a in (*) do (
    ren "%%a" "!counter!%%~xa"
    set /a counter+=1
)
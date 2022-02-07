@echo off

set url=https://example.com/
set count=30

echo loadtest.cmd by @aaviator42
echo v0.1   2022-02-06
echo:

echo URL: %url%
echo Count: %count%
echo Running...
echo:
for /l %%x in (1, 1, %count%) do (
   start cmd /c curl %url%
)

echo Done...
pause
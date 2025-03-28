@echo off

:: a2server.cmd
:: aaviator42
:: v0.2 - 2025-03-23

title Apache Server

rem apache lounge dist path
set APACHE_HOME=C:\aavibin\Apache24
set PORT=8081

:: Check if an argument is supplied, otherwise use the current directory as web root
if "%1"=="" (
    set WEB_ROOT=%cd%
) else (
    set WEB_ROOT=%1
)

:: Check if WEB_ROOT is a relative path (does not start with a drive letter or backslash)
echo %WEB_ROOT% | findstr /B /R "^[A-Za-z]:\\ .\\" >nul
if %ERRORLEVEL% NEQ 0 (
    set WEB_ROOT=%cd%\%WEB_ROOT%
)

echo Starting Apache HTTP Server with web root "%WEB_ROOT%" on localhost:%PORT%...

:: Create a temporary configuration file with the specified ServerRoot, DocumentRoot, ServerName, and <Directory> path
set TMP_CONF="%APACHE_HOME%\conf\httpd-temp.conf"
copy "%APACHE_HOME%\conf\httpd.conf" %TMP_CONF% > nul

:: Add necessary configuration settings to the temporary config file
(
    echo ServerRoot "%APACHE_HOME%"
    echo Listen %PORT%
    echo ServerName localhost:%PORT%
    echo DocumentRoot "%WEB_ROOT%"
    echo ErrorLog "%WEB_ROOT%\errors_httpd.log"
    echo ^<Directory "%WEB_ROOT%"^>
    echo    Options Indexes FollowSymLinks
    echo    AllowOverride All
    echo    Require all granted
    echo ^</Directory^>
) >> %TMP_CONF%

:: Add PHP error logging override (assumes php.ini is loaded by Apache, but forces location via Apache directive)
(
    echo php_admin_flag log_errors On
    echo php_admin_value error_log "%WEB_ROOT%\errors_php.log"
) >> %TMP_CONF%

:: Start Apache with the temporary configuration file
"%APACHE_HOME%\bin\httpd.exe" -f %TMP_CONF% -e info

pause

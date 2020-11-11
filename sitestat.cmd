@echo off

set URL=%1
set LOG_PATH=%2

if [%2]==[] (goto :cURLConnectDisp) else (goto :cURLConnectLog)
goto :quit

:cURLConnectLog
call :getTimestamp
del %TEMP%\resp.temp
curl -w ^
  "@config\curl_response_template_log.txt" -o NUL -s ^
  "%URL%" ^
  >>%TEMP%\resp.temp
  
set /P RESP= <%TEMP%\resp.temp 
set LOGOUTPUT=%DATETIME_NOW%;%RESP%
echo %LOGOUTPUT% >>%LOG_PATH%
exit /b

:cURLConnectDisp
curl -w ^
  "@config\curl_response_template_disp.txt" -o NUL -s ^
  "%URL%"
exit /b

:getTimestamp
for /f "tokens=1-6 delims=-" %%a in ('PowerShell -Command "& {Get-Date -format "yyyy-MM-dd-HH-mm-ss"}"') do (
    set year=%%a
    set month=%%b
    set date=%%c
    set hour=%%d
    set minute=%%e
    set second=%%f
)
SET DATETIME_NOW=%year%-%month%-%date% %hour%:%minute%:%second%
exit /b

:quit
endlocal
popd
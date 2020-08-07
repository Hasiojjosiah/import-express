@echo off

set "file=url.txt"
set /A i=0

for /F "usebackq delims=" %%a in ("%file%") do (
set /A i+=1
REM call echo %%i%%
call set array[%%i%%]=%%a
call set n=%%i%%
)
echo ----------------------------------------------
echo Drag here the SQL file or enter the file path:
echo.
for /L %%i in (1,1,%n%) do call set /P %%array[%%i]%%=%%array[%%i]%% Database File Path: 
echo Dropping Databases...
echo.

for /L %%i in (1,1,%n%) do call C:\wamp64\bin\mysql\mysql8.0.18\bin\mysqladmin -u root -h localhost -P 3308 drop if exist %%array[%%i]%%  -f
echo Creating Databases...

for /L %%i in (1,1,%n%) do call echo Creating  %%array[%%i]%% Database... & call C:\wamp64\bin\mysql\mysql8.0.18\bin\mysqladmin -u root -h localhost -P 3308 create %%array[%%i]%% -f 

echo.
pause
@echo off
set "file=database.ini"
set /A i=0

for /F "usebackq delims=" %%a in ("%file%") do (
set /A i+=1
REM call echo %%i%%
call set array[%%i%%]=%%a
call set path[%%i%%] = 

call set n=%%i%%
)

echo ----------------------------------------------
echo Drag here the SQL file or enter the file path:
echo.
for /L %%i in (1,1,%n%) do call set /P path[%%i]=%%array[%%i]%% SQL File Path: 
echo Dropping Databases...
echo.
for /L %%i in (1,1,%n%) do  IF DEFINED path[%%i] call C:\wamp64\bin\mysql\mysql8.0.18\bin\mysqladmin -u root -h localhost -P 3308 drop %%array[%%i]%%  -f 
echo Creating Databases...
for /L %%i in (1,1,%n%) do IF DEFINED path[%%i] call echo Creating  %%array[%%i]%% Database... & call C:\wamp64\bin\mysql\mysql8.0.18\bin\mysqladmin -u root -h localhost -P 3308 create %%array[%%i]%% -f 
echo Importing Databases....
for /L %%i in (1,1,%n%) do IF DEFINED path[%%i] call C:\wamp64\bin\mysql\mysql8.0.18\bin\mysql -u root %%array[%%i]%% < C:\Users\user04.PC401\Downloads\loan__08-09-2020_23_08_56.sql
echo.
color 0A
echo Importing Completed....


pause


@echo off
echo.
ECHO    This batch script will make you start on GM Island.
echo    Only MySQL should be running while you use this.
echo.

pause 

SET user=root
SET pass=root
SET world_db=mangos
SET dumppath=c:\
SET port=3306
SET host=localhost
SET mysqlpath=..\mysql5\bin

Echo Importing to database...
%mysqlpath%\mysql -h %host% --user=%user% --password=%pass% --port=%port% %world_db% < ..\sql\custom\Custom-START_ON_GM_ISLAND.sql

echo. 
echo Start position should be changed. Start the server and check.
echo If you see errors make sure you have started the mysql server!
echo (Start MySQL.bat)
echo.

pause
@echo off
echo.
ECHO    This batch script will reset your world database.
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


echo Replacing World DB with clean version...
%mysqlpath%\mysql -h %host% --user=%user% --password=%pass% --port=%port% %world_db% < ..\sql\FULL_WORLD_DB_09_08_2018.sql

echo. 
echo All game content should be reset to its default repack state.
echo If you see errors make sure you have started the mysql server!
echo (Start MySQL.bat)
echo.

pause
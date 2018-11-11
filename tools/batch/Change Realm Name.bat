@echo off
if exist NewName.sql del NewName.sql
echo.
ECHO    MaNGOS easy realm name changer by brotalnia.
echo    Only MySQL should be running while you use this.
echo.

set /p realmname=   New realm name: 

ECHO USE `realmd`;>NewName.sql
ECHO UPDATE `realmlist` SET `name`='%realmname%' WHERE `id`=1;>>NewName.sql

pause 
echo.
echo.
echo Name changed to: 
echo %realmname% 

SET user=root
SET pass=root
SET logon_db=realmd
SET dumppath=c:\
SET port=3306
SET host=localhost
SET mysqlpath=..\mysql5\bin

Echo Importing to database...
%mysqlpath%\mysql -h %host% --user=%user% --password=%pass% --port=%port% %logon_db% < NewName.sql



echo. 
echo If you see errors make sure you have started the mysql server!
echo (Start MySQL.bat)
echo.

pause
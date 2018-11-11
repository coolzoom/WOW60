@echo off
if exist NewAddress.sql del NewAddress.sql
echo.
ECHO    MaNGOS easy realm ip changer by brotalnia.
echo    If you don't know what your IP address is, go to this website:
echo    https://www.whatismyip.com/
echo.

set /p realip=   Real IP address of the host: 

ECHO USE `realmd`;>NewAddress.sql
ECHO UPDATE `realmlist` SET `address`='%realip%' WHERE `id`=1;>>NewAddress.sql

pause 
echo.
echo.
echo IP changed to: 
echo %realip% 

SET user=root
SET pass=root
SET logon_db=realmd
SET dumppath=c:\
SET port=3306
SET host=localhost
SET mysqlpath=..\mysql5\bin

Echo Importing to database...
%mysqlpath%\mysql -h %host% --user=%user% --password=%pass% --port=%port% %logon_db% < NewAddress.sql



echo. 
echo If you see errors make sure you have started the mysql server!
echo (Start MySQL.bat)
echo.
ECHO Done. Don't forget to change your game's realmlist too.
echo.

pause
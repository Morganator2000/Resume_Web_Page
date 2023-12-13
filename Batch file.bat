@echo off
:menu
echo type in a number to execute that function
echo 1. Test ping
echo 2. Show ip address
echo 3. release your IP address
echo 4. renew the network adaptor IP address
echo 5. clear DNS cache 
echo 6. stop the print spooler
echo 7. start the print spooler
echo 8. Which user am I?
echo 9. Create a new directory
echo 10. Check the hard drive
echo 11. Enter the matrix
echo 12. Blood for the blood god
echo 13. Open MS paint
echo 14. Open the command prompt (again?)
echo 15. Quit

SET /P M=Type your number then press ENTER:
IF %M%==1 GOTO ping
IF %M%==2 GOTO ipconfig
IF %M%==3 GOTO release
IF %M%==4 GOTO renew
IF %M%==5 GOTO flush
IF %M%==6 GOTO stop spooler
IF %M%==7 GOTO start spooler
IF %M%==8 GOTO whoami
IF %M%==9 GOTO create
IF %M%==10 GOTO Chkdsk
IF %M%==11 GOTO green
IF %M%==12 GOTO red 
IF %M%==13 GOTO paint
IF %M%==14 GOTO command
IF %M%==15 GOTO exit 

:ping
ping
GOTO menu

:ipconfig
ipconfig
GOTO menu

:release
ipconfig /release
GOTO menu

:renew
ipconfig /renew
GOTO menu

:flush
ipconfig /flushdns 
GOTO menu

:stop spooler
net stop 
GOTO menu

:start spooler
net start
GOTO menu

:whoami
whoami/user
GOTO menu

:create
md user
GOTO menu

:Chkdsk
Chkdsk C:
GOTO menu

:green
color 02
GOTO menu

:red
color 40
GOTO menu

:paint
mspaint
GOTO menu

:command
GOTO start cmd
GOTO menu

:exit
exit
GOTO menu
:######## Convert GoPro Video to Prelude Compatible Video ########
:## Script Requirements:					##
:## 		FFmbc.exe				  	##
:##								##
:## Author: Ryan Lally						##
:## Email: rlally@cogsd.com					##
:## Updated: 02/24/2013						##
:#################################################################
@echo off

:################### Configure Script Here #######################

:Destination Folder
set DEST=.\~CONVERTED

:Conversion Log Path
set "LOG_PATH=%DEST%\log.txt"

:FFmbc.exe Path
set FFmbc=C:\Program Files\FFmbc\ffmbc.exe

:#################################################################

:Suppresses "subdirectory already exists error"
2>NUL MD "%DEST%"

:Echo Log Header
echo Converstion Started - (%date% %time%) > %LOG_PATH%

call:ProcessDirectory .

PAUSE

goto:eof
: End of Main Script


:######################## Functions ##############################

:ConvertFiles
set var=%~1
call:LOG "Mkdir - %DEST%%var:~1%"
2>NUL MD "%DEST%%var:~1%"
FOR %%f IN ("%~1\*.mp4") DO (
	: Conversion String
	set DI=%%f
	setlocal EnableDelayedExpansion
	set DF=%DEST%!DI:~1!
	2>NULL "%FFmbc%" -i "%%f" -y -vcodec copy -acodec aac -strict experimental -ab 512k "!DF!"
	call:LOG "Convert - !DF!"
	endlocal
)
goto:eof

:ProcessDirectory
call:ConvertFiles "%~1"
FOR /d %%d IN ("%~1\*") DO (
	IF NOT %%d == %DEST% (
		call:ProcessDirectory "%%d"
	)
)
goto:eof

:LOG
echo %~1
echo %~1 >> %LOG_PATH%
goto:eof
:#################################################################
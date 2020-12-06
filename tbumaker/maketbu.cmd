@echo off

set /p version="Enter version (ex: 10810 for 1.08.10): "

echo Converting Next Issue2 (Xilinx)

..\utils\Bit2Bin ..\synth-zxnext-issue2\work\zxnext_top_issue2.bit zxnext.bin
IF %ERRORLEVEL% NEQ 0 goto error

echo making TBBLUE.TBU for ZX Spectrum Next (issue2)
.\tbumaker 10 %version%
IF ERRORLEVEL 1 goto error

set myprefix=%date:~6,4%.%date:~3,2%.%date:~0,2%.%time:~0,2%.%time:~3,2%
copy TBBLUE.TBU "TBBLUE.TBU.NextI2.%myprefix%"
IF ERRORLEVEL 1 goto error

rem copy /y TBBLUE.TBU f:\
goto exit

:error
echo Error!!

:exit
pause

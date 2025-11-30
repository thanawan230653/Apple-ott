Write-Host "Running NINJA Secure Unlock..." -ForegroundColor Green

# ==== ตัวอย่างคำสั่งจริง (คุณแก้ได้เลย) ====
@echo off
cd bin
s.txt
mode con lines=12 cols=35
color 6f
cls
title TOOL_T3AMX3_SKWAMX3 Serial
:main
cls
echo.
echo.
echo.
ECHO 1 - SK/T3 EDIT Serial
ECHO 2 - FIX T3AMX3 Usb bring Mode
ECHO 3 - EXIT
ECHO.
SET /P M=Type 1, 2 ENTER:
IF %M%==1 GOTO op1
IF %M%==2 GOTO FX
IF %M%==3 GOTO exit

:op1

update bulkcmd "keyman write usid str 0000000000"
update bulkcmd "keyman write usid str 1234567890"
update bulkcmd "keyman read usid"
update bulkcmd "saveenv"
update bulkcmd "reset"
echo 
goto main

:FX
fastboot flashing unlock
fastboot getvar all
fastboot oem update
goto main

# edit by pawarit


Write-Host "Secure unlock done." -ForegroundColor Yellow

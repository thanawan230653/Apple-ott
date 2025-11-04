@echo off
mode con lines=33 cols=95
color 4f
cls
title TOOL Unlock Bootloader SKWAMX3 TRUEID_SKYWORT_HP42F BY PAT
:main

echo.
echo.
echo.
echo     ################################################################################
echo     #  Android TV Box SKWAMX3 SKYWORT_HP42F ATV-10                                # 
echo     #  FB : Pawarit Sosirikul                                                      #
echo     #  https://www.facebook.com/wsewac                                             #
echo     #  Android TV Thailand                                                         #
echo     #  https://www.facebook.com/groups/484059020900865                             #
echo     #  Telegram / Phone : 0863911097                                               #
echo     ################################################################################
echo.
echo.
echo     ################################################################################
echo     #         CHUNG TOI KHONG CHIU TRACH NHIEM BAT CU THIET BI NAO BRICK !!        #
echo     #                HAY CAN NHAC THAT KI TRUOC KHI LAM !!                         #
echo     ################################################################################
echo.
echo.
ECHO 1 - 1 CLICK LA XONG
echo.
echo.
ECHO 2 - THOAT ( QUAY DAU LA BO )
ECHO.
SET /P M=Type 1, 2 SAU DO NHAN ENTER:
IF %M%==1 GOTO op1
IF %M%==2 GOTO exit

:op1
update.exe identify 7
ECHO  0k ...
update bulkcmd "keyman write usid str 0000000000"
ECHO  0k ...
update bulkcmd "keyman write usid str 1234567890"
ECHO  0k ...
update bulkcmd "keyman read usid"
ECHO  0k ...
update bulkcmd saveenv
ECHO  0k ...
update bulkcmd reset
pause
cls
goto main



# Edit By Pawarit sosrirkul
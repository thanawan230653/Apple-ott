
@echo off
setlocal EnableDelayedExpansion

:: เปิดโหมด ANSI สี
for /f "tokens=2 delims=:." %%i in ('ver') do if %%i GEQ 10 (
    >nul echo|set /p=[0m
)

cls
echo [92m========================================[0m
echo [96m          Amlogic Dumper Tool[0m
echo [92m========================================[0m
echo [93mBefore going any further[0m
echo [93mPlease connect your Amlogic box in MASKROM mode[0m
echo [92m----------------------------------------[0m
pause

:: Clean folders
if exist dtb rmdir /s /q dtb
md dtb

if exist dump rmdir /s /q dump
md dump

echo [96m----------------------------------------[0m
set /P blsize=[92mInput bootloader size in bytes (default 4194304): [0m
set /P dtbsize=[92mInput dtb size in bytes (default 262144): [0m

echo [96mReading bootloader & dtb...[0m
bin\windows\update mread store bootloader normal !blsize! dump\bootloader.img
bin\windows\update mread store _aml_dtb normal !dtbsize! dtb\dtb.img

if exist dtb\dtb.img (
    echo [96mProcessing DTB...[0m
    bin\windows\dtc -I dtb -O dts -o dtb\single.dts dtb\dtb.img
    bin\windows\7za x dtb\dtb.img -y > NUL:
    bin\windows\dtbSplit dtb\dtb.img dtb\

    if exist _aml_dtb (
        bin\windows\dtbSplit _aml_dtb dtb\
        del _aml_dtb
    )

    for %%x in (dtb\*.dtb) do (
        bin\windows\dtc -I dtb -O dts -o dtb\%%~nx.dts %%x
        del %%x
    )

    move dtb\dtb.img dump\ >nul

    SET /A COUNT=0
    echo [92mAvailable DTS Files:[0m

    for %%a in (dtb\*.dts) do (
        set /a count += 1
        echo [96m!count! - %%~na[0m
    )

    echo [92m----------------------------------------[0m
    set /P dtsfile=[92mInput DTS name for dump: [0m

    if not exist dtb\!dtsfile!.dts (
        echo [91mERROR: Can't find that DTS file![0m
        pause
        exit 0
    )

    echo [96mExtracting partition info...[0m
    bin\windows\grep -P "\tpname" dtb\!dtsfile!.dts | bin\windows\grep -oP "(?<="")\w+">dump\partitions.txt

    for /f "tokens=*" %%s in (dump\partitions.txt) do (
        echo [92mDumping partition: %%s...[0m
        bin\windows\sed -n "/%%s {/,/};/p" dtb\!dtsfile!.dts | bin\windows\grep -A 3 "pname" | bin\windows\grep "size" | bin\windows\grep -oP "(?<=0x0 )\w+">dump\%%s_size.txt
        set /p size=<"dump\%%s_size.txt"
        bin\windows\update mread store %%s normal !size! dump\%%s.img
        del dump\%%s_size.txt
    )
)

if exist dump\partitions.txt del dump\partitions.txt
if exist dtb\ rmdir /s /q dtb

echo [92m========================================[0m
echo [92m                DONE![0m
echo [92m========================================[0m
pause
exit

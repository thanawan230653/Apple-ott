# TOOL_T3AMX3_SKWAMX3 Serial - PowerShell Version

# ตั้งขนาดหน้าจอ & สีใกล้เคียงกับ color 6f
$rawUI = $Host.UI.RawUI
$size  = $rawUI.WindowSize
$size.Width  = 35
$size.Height = 12
$rawUI.WindowSize = $size
$rawUI.BufferSize = $size
$rawUI.WindowTitle = "TOOL_Amlogic Serial"
$rawUI.BackgroundColor = "DarkYellow"
$rawUI.ForegroundColor = "White"
Clear-Host

function Show-Menu {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host " 1 - SK/T3 Flash custom Serial"
    Write-Host " 2 - FIX T3AMX3 Usb bring Mode"
    Write-Host " 3 - EXIT"
    Write-Host ""
}

function Do-Op1 {
    # เทียบกับ :op1 ใน batch
./bin/update bulkcmd "keyman init 0x1234"
./bin/update bulkcmd "keyman write usid str 24154048420000"
./bin/update bulkcmd "keyman read usid"
./bin/update bulkcmd "saveenv"
./bin/update bulkcmd erase bootloader
./bin/update bulkcmd "reset"
    Write-Host ""
    Read-Host "Enter Goto Manu"
}

function Do-FX {
    # เทียบกับ :FX ใน batch
./bin/fastboot flashing unlock
./bin/fastboot getvar all
./bin/fastboot oem update
    Read-Host "Enter Goto Manu"
}

# ===== main loop =====
while ($true) {
    Show-Menu
    $M = Read-Host "Type 1, 2 ENTER"

    switch ($M) {
        '1' { Do-Op1 }
        '2' { Do-FX }
        '3' { break }
        default {
            Write-Host "เลือกไม่ถูกต้อง" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}

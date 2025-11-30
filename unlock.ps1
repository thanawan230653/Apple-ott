# TOOL_T3AMX3_SKWAMX3 Serial - PowerShell Version

# ตั้งขนาดหน้าจอ & สีใกล้เคียงกับ color 6f
$rawUI = $Host.UI.RawUI
$size  = $rawUI.WindowSize
$size.Width  = 35
$size.Height = 12
$rawUI.WindowSize = $size
$rawUI.BufferSize = $size
$rawUI.WindowTitle = "TOOL_T3AMX3_SKWAMX3 Serial"
$rawUI.BackgroundColor = "DarkYellow"
$rawUI.ForegroundColor = "White"
Clear-Host

function Show-Menu {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host " 1 - SK/T3 EDIT Serial"
    Write-Host " 2 - FIX T3AMX3 Usb bring Mode"
    Write-Host " 3 - EXIT"
    Write-Host ""
}

function Do-Op1 {
    # เทียบกับ :op1 ใน batch
./update bulkcmd "keyman write usid str 0000000000"
./update bulkcmd "keyman write usid str 1234567890"
./update bulkcmd "keyman read usid"
./update bulkcmd "saveenv"
./update bulkcmd "reset"
    Write-Host ""
    Read-Host "เสร็จแล้ว กด Enter เพื่อกลับเมนู"
}

function Do-FX {
    # เทียบกับ :FX ใน batch
./fastboot flashing unlock
./fastboot getvar all
./fastboot oem update
    Read-Host "เสร็จแล้ว กด Enter เพื่อกลับเมนู"
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

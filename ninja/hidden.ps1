# ==========================================================
#  Ninja Unlock – Secure Hidden Payload
#  This script is executed remotely from unlock.bat
#  DO NOT EXPOSE THIS FILE PUBLICLY
# ==========================================================

# ฟังก์ชันพิมพ์แบบมีสี
function Write-Green($msg){ Write-Host $msg -ForegroundColor Green }
function Write-Yellow($msg){ Write-Host $msg -ForegroundColor Yellow }
function Write-Red($msg){ Write-Host $msg -ForegroundColor Red }
function Write-Cyan($msg){ Write-Host $msg -ForegroundColor Cyan }
Set-Location "$PSScriptRoot\bin

Clear-Host
Write-Cyan "==============================================="
Write-Cyan "        NINJA STB UNLOCK"
Write-Cyan "==============================================="
Write-Host ""

Write-Yellow "Loading internal unlock modules..."
Start-Sleep -Milliseconds 500

# ==========================================================
#               🔥 คำสั่งจริงให้แก้ตรงนี้ 🔥
# ==========================================================
Write-Host "Secure unlock done." -ForegroundColor Yellow

Read-Host "กด Enter เพื่อไปต่อ"


Write-Green "[1] Checking Fastboot device..."
fastboot devices

Write-Green "[2] Sending OEM unlock command..."
fastboot oem unlock

Write-Green "[3] Unlocking bootloader..."
fastboot flashing unlock

Write-Green "[4] Flashing LK..."
fastboot flash lk lk.bin

Write-Green "[5] Flashing Boot..."
fastboot flash boot boot.img

# ==========================================================

Write-Host ""
Write-Yellow "-----------------------------------------------"
Write-Yellow "   ✔ Secure Unlock Script Completed"
Write-Yellow "-----------------------------------------------"
Write-Host ""

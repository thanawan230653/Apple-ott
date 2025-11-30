# ==========================================================
#  Ninja Unlock – Secure Hidden Payload (No BIN folder)
# ==========================================================

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# สี
function G($m){Write-Host $m -ForegroundColor Green}
function Y($m){Write-Host $m -ForegroundColor Yellow}
function R($m){Write-Host $m -ForegroundColor Red}
function C($m){Write-Host $m -ForegroundColor Cyan}

Clear-Host
C "==============================================="
C "      NINJA SECURE REMOTE EXECUTION"
C "==============================================="
Write-Host ""

Y "Loading modules..."
Start-Sleep -Milliseconds 300

# ==========================================================
# ตรวจ fastboot.exe และไฟล์ img
# ==========================================================

if (!(Test-Path "fastboot.exe")) { R "❌ fastboot.exe not found"; Read-Host; exit }
if (!(Test-Path "boot.img"))      { R "❌ boot.img not found"; Read-Host; exit }
if (!(Test-Path "dtbo.img"))      { R "❌ dtbo.img not found"; Read-Host; exit }
if (!(Test-Path "super.img"))     { R "❌ super.img not found"; Read-Host; exit }
if (!(Test-Path "vbmeta.img"))    { R "❌ vbmeta.img not found"; Read-Host; exit }
if (!(Test-Path "lk.bin"))        { R "❌ lk.bin not found"; Read-Host; exit }

# ==========================================================
# คำสั่งจริง
# ==========================================================

G "[1] Checking Fastboot…"
./fastboot.exe devices

G "[2] OEM Unlock…"
./fastboot.exe oem unlock

G "[3] Unlocking Bootloader…"
./fastboot.exe flashing unlock

G "[4] Flash LK…"
./fastboot.exe flash lk "lk.bin"

G "[5] Flash BOOT…"
./fastboot.exe flash boot "boot.img"

G "[6] Flash DTBO…"
./fastboot.exe flash dtbo "dtbo.img"

G "[7] Flash SUPER…"
./fastboot.exe flash super "super.img"

G "[8] Flash VBMETA…"
./fastboot.exe flash vbmeta "vbmeta.img"

Write-Host ""
Y "-----------------------------------------------"
Y "   ✔ Secure Unlock Script Completed"
Y "-----------------------------------------------"
Write-Host ""

Read-Host "Press ENTER to close"

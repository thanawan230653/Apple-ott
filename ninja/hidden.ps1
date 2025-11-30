# ==========================================================
#  Ninja Unlock – Secure Hidden Payload
# ==========================================================

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# สี
function G($m){Write-Host $m -ForegroundColor Green}
function Y($m){Write-Host $m -ForegroundColor Yellow}
function R($m){Write-Host $m -ForegroundColor Red}
function C($m){Write-Host $m -ForegroundColor Cyan}

Clear-Host
C "==============================================="
C "         NINJA SECURE REMOTE EXECUTION"
C "==============================================="
Write-Host ""

Y "Loading modules..."
Start-Sleep -Milliseconds 300

# ==========================================================
#  ไปยังโฟลเดอร์ bin ที่มี fastboot และไฟล์ img
# ==========================================================
$bin = "$PSScriptRoot\bin"
if (!(Test-Path $bin)) { R "❌ bin folder not found!"; Read-Host; exit }
Set-Location $bin

$fb = "$bin\fastboot.exe"
if (!(Test-Path $fb)) { R "❌ fastboot.exe not found"; Read-Host; exit }

# ==========================================================
#  เริ่ม flash จริง
# ==========================================================

G "[1] Checking Fastboot…"
& $fb devices

G "[2] OEM Unlock…"
& $fb oem unlock

G "[3] Flashing LK…"
& $fb flash lk "$bin\lk.bin"

G "[4] Flashing BOOT…"
& $fb flash boot "$bin\boot.img"

G "[5] Flashing DTBO…"
& $fb flash dtbo "$bin\dtbo.img"

G "[6] Flashing SUPER…"
& $fb flash super "$bin\super.img"

G "[7] Flashing VBMETA…"
& $fb flash vbmeta "$bin\vbmeta.img"

Write-Host ""
Y "-----------------------------------------------"
Y "   ✔ Secure Unlock Script Completed"
Y "-----------------------------------------------"
Write-Host ""

Read-Host "Press ENTER to exit"

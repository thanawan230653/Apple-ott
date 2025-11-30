Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

function G($m){Write-Host $m -ForegroundColor Green}
function Y($m){Write-Host $m -ForegroundColor Yellow}
function R($m){Write-Host $m -ForegroundColor Red}
function C($m){Write-Host $m -ForegroundColor Cyan}

Clear-Host
C "==============================================="
C "        NINJA SECURE REMOTE EXECUTION"
C "==============================================="
Write-Host ""

Y "Loading modules..."
Start-Sleep -Milliseconds 300

$bin = "$PSScriptRoot\bin"
if (!(Test-Path $bin)) { R "❌ bin folder missing!"; Read-Host; exit }
Set-Location $bin

$fb = "$bin\fastboot.exe"
if (!(Test-Path $fb)) { R "❌ fastboot.exe missing"; Read-Host; exit }

G "[1] Fastboot devices"
& $fb devices

G "[2] OEM Unlock"
& $fb oem unlock

G "[3] Unlocking bootloader"
& $fb flashing unlock

G "[4] Flash LK"
& $fb flash lk "$bin\lk.bin"

G "[5] Flash BOOT"
& $fb flash boot "$bin\boot.img"

G "[6] Flash DTBO"
& $fb flash dtbo "$bin\dtbo.img"

G "[7] Flash SUPER"
& $fb flash super "$bin\super.img"

G "[8] Flash VBMETA"
& $fb flash vbmeta "$bin\vbmeta.img"

Write-Host ""
Y "-----------------------------------------------"
Y "   ✔ Secure Unlock Script Completed"
Y "-----------------------------------------------"
Write-Host ""

Read-Host "Press ENTER to close"

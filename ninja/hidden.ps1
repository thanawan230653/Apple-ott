# ==========================================================
#  Ninja Unlock – Secure Hidden Payload
# ==========================================================

# ปลดบล็อก PS Script
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# ฟังก์ชันพิมพ์สี
function Out-Green($m){Write-Host $m -ForegroundColor Green}
function Out-Yellow($m){Write-Host $m -ForegroundColor Yellow}
function Out-Red($m){Write-Host $m -ForegroundColor Red}
function Out-Cyan($m){Write-Host $m -ForegroundColor Cyan}

Clear-Host
Out-Cyan "==============================================="
Out-Cyan "        NINJA SECURE REMOTE EXECUTION"
Out-Cyan "==============================================="
Write-Host ""

Out-Yellow "Loading modules..."
Start-Sleep -Milliseconds 300

# ==========================================================
#  ย้ายไป bin แบบปลอดภัย
# ==========================================================
$bin = "$PSScriptRoot\bin"

if (!(Test-Path $bin)) {
    Out-Red "❌ ERROR: Folder 'bin' not found!"
    Read-Host "กด Enter เพื่อออก"
    exit
}

Set-Location $bin

# ตรวจ fastboot.exe
if (!(Test-Path "$bin\fastboot.exe")) {
    Out-Red "❌ ERROR: fastboot.exe ไม่อยู่ในโฟลเดอร์ bin"
    Read-Host "กด Enter เพื่อออก"
    exit
}

# ==========================================================
#  คำสั่งจริง
# ==========================================================

Out-Green "[1] Checking Fastboot..."
& "$bin\fastboot.exe" devices

Out-Green "[2] OEM Unlock..."
& "$bin\fastboot.exe" grtvar unlockig

& "$bin\fastboot.exe" flash boot "$bin\boot.img"
& "$bin\fastboot.exe" flash dtbo "$bin\dtbo.img"
& "$bin\fastboot.exe" flash super "$bin\super.img"
& "$bin\fastboot.exe" flash vbmeta "$bin\vbmeta.img"


Out-Green "[8] Clk"
& "$bin\fastboot -w

Out-Green "[9] reboot system"
& "$bin\fastboot reboot


# ==========================================================

Write-Host ""
Out-Yellow "-----------------------------------------------"
Out-Yellow "  ✔ Secure Unlock Script Completed"
Out-Yellow "-----------------------------------------------"
Write-Host ""

Read-Host "กด Enter เพื่อปิด"

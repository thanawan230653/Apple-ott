Write-Host "Running NINJA Secure Unlock..." -ForegroundColor Green

# ==== ตัวอย่างคำสั่งจริง (คุณแก้ได้เลย) ====
fastboot devices
fastboot oem unlock
fastboot flashing unlock
fastboot flash lk lk.bin
fastboot flash boot boot.img

Write-Host "Secure unlock done." -ForegroundColor Yellow

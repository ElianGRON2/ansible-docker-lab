# ============================
# Instalar WSL + Ubuntu + Ansible automáticamente
# ============================

Write-Host "🔧 Verificando instalación de WSL..." -ForegroundColor Cyan
wsl --version 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Host "▶ Instalando WSL..." -ForegroundColor Yellow
    wsl --install
    Write-Host "💠 Reinicia Windows y ejecuta este script nuevamente." -ForegroundColor Green
    exit
}

Write-Host "✔ WSL está instalado." -ForegroundColor Green

Write-Host "🔧 Verificando si Ubuntu está instalado..." -ForegroundColor Cyan
$distros = wsl --list --verbose

if ($distros -notmatch "Ubuntu") {
    Write-Host "▶ Instalando Ubuntu..." -ForegroundColor Yellow
    wsl --install -d Ubuntu
    Write-Host "💠 Abre Ubuntu una vez para completar la configuración." -ForegroundColor Green
    exit
}

Write-Host "✔ Ubuntu está instalado." -ForegroundColor Green

Write-Host "▶ Instalando Ansible dentro de Ubuntu..." -ForegroundColor Yellow
wsl -d Ubuntu -- bash -c "sudo apt update && sudo apt install -y ansible"

Write-Host "🎉 Instalación completa."
Write-Host "Ahora abre Ubuntu y ejecuta:"
Write-Host "    ansible --version" -ForegroundColor Cyan

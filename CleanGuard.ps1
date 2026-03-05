# Build script to compile CleanGuard.ps1 to CleanGuard.exe
# Requires PS2EXE module: Install-Module -Name ps2exe -Scope CurrentUser

Write-Host "Building CleanGuard.exe..." -ForegroundColor Cyan

# Check if PS2EXE is installed
if (-not (Get-Module -ListAvailable -Name ps2exe)) {
    Write-Host "PS2EXE module not found. Installing..." -ForegroundColor Yellow
    Install-Module -Name ps2exe -Scope CurrentUser -Force
    Import-Module ps2exe
}

# Compile the script
$scriptPath = Join-Path $PSScriptRoot "CleanGuard.ps1"
$exePath = Join-Path $PSScriptRoot "CleanGuard.exe"
$iconPath = Join-Path $PSScriptRoot "Autorun.ico"

Write-Host "Compiling $scriptPath to $exePath..." -ForegroundColor Cyan

if (Test-Path $iconPath) {
    Write-Host "Using icon: $iconPath" -ForegroundColor Cyan
    Invoke-ps2exe -inputFile $scriptPath -outputFile $exePath -title "CleanGuard" -description "CleanGuard - Real-time file protection" -iconFile $iconPath -noConsole:$true -requireAdmin:$true -supportOS:$true -longPaths:$true
} else {
    Write-Host "Warning: Icon file not found, using default icon" -ForegroundColor Yellow
    Invoke-ps2exe -inputFile $scriptPath -outputFile $exePath -title "CleanGuard" -description "CleanGuard - Real-time file protection" -iconFile $null -noConsole:$true -requireAdmin:$true -supportOS:$true -longPaths:$true
}

if (Test-Path $exePath) {
    Write-Host "`nSuccess! CleanGuard.exe created at:" -ForegroundColor Green
    Write-Host $exePath -ForegroundColor White
    Write-Host "`nYou can now run CleanGuard.exe. It will:" -ForegroundColor Cyan
    Write-Host "  1. Copy itself to C:\ProgramData\CleanGuard\" -ForegroundColor White
    Write-Host "  2. Create a startup shortcut" -ForegroundColor White
    Write-Host "  3. Launch the installed version" -ForegroundColor White
} else {
    Write-Host "`nBuild failed!" -ForegroundColor Red
    exit 1
}

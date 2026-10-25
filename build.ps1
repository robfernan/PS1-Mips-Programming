<#
  Build every (or one) lesson in this repo natively on Windows.
  Uses armips + bin2exe.py, same as the Linux Makefiles.

  .\build.ps1                       # build all lessons
  .\build.ps1 hellogpu_triangle     # build one
  .\build.ps1 hellogpu_quad -Run    # build and open in DuckStation / PCSX-Redux
#>
param([string]$Lesson, [switch]$Run)
$ErrorActionPreference = "Stop"

$armips = $env:ARMIPS
if (-not $armips) { $armips = Join-Path $env:USERPROFILE "Documents\Projects\PS1Dev\armips\armips.exe" }
if (-not (Test-Path $armips)) { throw "armips not found. Set `$env:ARMIPS or download from https://github.com/Kingcom/armips/releases" }

$dirs = if ($Lesson) { @(Get-Item (Join-Path $PSScriptRoot $Lesson)) }
        else { Get-ChildItem $PSScriptRoot -Directory | Where-Object { Test-Path (Join-Path $_.FullName "*.s") } }

foreach ($d in $dirs) {
    Push-Location $d.FullName
    try {
        $src = Get-ChildItem *.s | Select-Object -First 1
        Write-Host "[$($d.Name)] armips $($src.Name)" -ForegroundColor Cyan
        & $armips $src.Name
        if ($LASTEXITCODE -ne 0) { throw "armips failed in $($d.Name)" }
        $bin = [IO.Path]::ChangeExtension($src.Name, ".bin")
        $exe = [IO.Path]::ChangeExtension($src.Name, ".ps-exe")
        python bin2exe.py $bin $exe
        Write-Host "[$($d.Name)] OK -> $exe" -ForegroundColor Green
        if ($Run) {
            $emu = Get-Command pcsx-redux, DuckStation -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($emu) { & $emu.Source (Resolve-Path $exe) } else { Write-Warning "No emulator on PATH" }
        }
    } finally { Pop-Location }
}

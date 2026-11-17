@echo off
setlocal
cd /d "%~dp0"
set "ELECTRON_START_URL=http://127.0.0.1:5199"
set "OMB_UI_PORT=5199"
powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command ^
  "$ErrorActionPreference='SilentlyContinue';" ^
  "function Up($p){ [bool](Get-NetTCPConnection -State Listen -LocalPort $p) };" ^
  "function ViteReady(){ try { $r=Invoke-WebRequest -UseBasicParsing -Uri 'http://127.0.0.1:5199/src/main.tsx' -TimeoutSec 2; return ($r.Headers['Content-Type'] -match 'javascript') } catch { return $false } };" ^
  "$kids=@();" ^
  "if(-not (Up 8799)){ $kids += Start-Process cmd -ArgumentList '/c pnpm dev:server' -WindowStyle Hidden -PassThru };" ^
  "if(-not (Up 5199)){ $kids += Start-Process cmd -ArgumentList '/c pnpm dev --port 5199 --strictPort' -WindowStyle Hidden -PassThru };" ^
  "for($i=0;$i -lt 90 -and -not ((Up 8799) -and (ViteReady));$i++){ Start-Sleep 1 };" ^
  "if(-not (ViteReady)){ foreach($k in $kids){ taskkill /T /F /PID $k.Id | Out-Null }; (New-Object -ComObject WScript.Shell).Popup('Vite dev server khong chay tren cong 5199 (cong co the dang bi chiem). Hay dong tien trinh dang giu cong 5199 roi thu lai.',0,'OpenMausBot',16) | Out-Null; exit 1 };" ^
  "$d=Start-Process cmd -ArgumentList '/c pnpm dev:desktop' -WindowStyle Hidden -PassThru;" ^
  "$d.WaitForExit();" ^
  "foreach($k in $kids){ taskkill /T /F /PID $k.Id | Out-Null }"
endlocal

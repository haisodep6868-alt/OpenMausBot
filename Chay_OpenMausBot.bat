@echo off
setlocal
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command ^
  "$ErrorActionPreference='SilentlyContinue';" ^
  "function Up($p){ [bool](Get-NetTCPConnection -State Listen -LocalPort $p) };" ^
  "$kids=@();" ^
  "if(-not (Up 8799)){ $kids += Start-Process cmd -ArgumentList '/c pnpm dev:server' -WindowStyle Hidden -PassThru };" ^
  "if(-not (Up 5199)){ $kids += Start-Process cmd -ArgumentList '/c pnpm dev' -WindowStyle Hidden -PassThru };" ^
  "for($i=0;$i -lt 60 -and -not ((Up 8799) -and (Up 5199));$i++){ Start-Sleep 1 };" ^
  "$d=Start-Process cmd -ArgumentList '/c pnpm dev:desktop' -WindowStyle Hidden -PassThru;" ^
  "$d.WaitForExit();" ^
  "foreach($k in $kids){ taskkill /T /F /PID $k.Id | Out-Null }"
endlocal

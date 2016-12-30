@echo off
bin\openocd.exe -c "set arc_bin %1" -f scripts\interface\ftdi\jlink.cfg -f scripts\board\quark_se.cfg -f scripts\flash-bl-arc-x86-jlink.cfg
if %ERRORLEVEL% NEQ 0 (
  echo.
  echo ***ERROR***
  exit /b 1
) else (
  echo.
  echo !!!SUCCESS!!!
)
PAUSE

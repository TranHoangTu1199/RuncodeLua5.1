@echo off
title Run code
chcp 65001
cls
set tm=
set file=
set oldtime=
set newtime=
set timeout=
set timeout_s=
set timeout_ms=
color f
set /p tm=Nhập đường dẫn chứa file code: 
cd %tm%
set /p file=Nhập tên file code cần chạy: 
goto:run

:run
cls
set /A oldtime=%time:~0,2% * 360000 + %time:~3,2% * 6000 + %time:~6,2% * 100 + %time:~9,2%
%file%
set /A newtime=%time:~0,2% * 360000 + %time:~3,2% * 6000 + %time:~6,2% * 100 + %time:~9,2%
set /A timeout=%newtime% - %oldtime%
if %newtime% lss %oldtime% set timeout=0
set timeout_ms=0%timeout%
set /A timeout_s=%timeout% / 100
echo.
echo ======================
echo ~ Code runtime: %timeout_s%.%timeout_ms:~-0,2%s.
pause >nul
goto:run
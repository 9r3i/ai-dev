@echo off
set ai_boundary="-9r3i -php"
set ai_script="%SystemDrive%\9r3i\ai-core\aiConsole.php"
php %ai_script% %~dp1 %ai_boundary% %* 2>nul
if %errorlevel% equ 0 goto END
if %errorlevel% equ 9009 goto NOPHP
if %errorlevel% neq 0 goto ERROR
:NOPHP
echo Error: Require PHP
goto END
:ERROR
echo Error: %errorlevel%
:END

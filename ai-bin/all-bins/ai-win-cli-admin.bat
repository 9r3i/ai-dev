@echo off

:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo %~dp1>C:\9r3i\ai\temp\dp1.tmp
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    set /p CDIR=<C:\9r3i\ai\temp\dp1.tmp
    pushd "%CD%"
    CD /D "%CDIR%"
    @del C:\9r3i\ai\temp\dp1.tmp
    title AI Admin

::--------------------------------------    

REM ----- THIS IS AI SCRIPT -----
set ai_boundary="-9r3i -php"
set ai_script="%SystemDrive%\9r3i\ai\auto.ai"
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
pause>nul



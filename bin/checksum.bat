@echo off
setlocal

if "%~1"=="" (
    echo [31mPls enter a path to file.[0m
    exit /b 1
)


if "%~2"=="" (
    echo [31mPls enter a hashing algorithm Example: SHA256, SHA512,..[0m
    exit /b 1
)


for /f "skip=1 tokens=*" %%a in ('certutil -hashfile "%~1" "%~2" ^| find /v "CertUtil"') do (
    set hash=%%a
    goto :break
)
:break

set hash=%hash: =%

if "%~3"=="" (
    echo %hash%
) else (
    if /i "%hash%"=="%~3" (
        echo [32mHash matches![0m
    ) else (
        echo [31mHash does not match[0m
    )
)

endlocal

@echo off
if "%1"=="" (
    echo [31mPls Input your file name[0m
) else (
    type nul > "%1"
)


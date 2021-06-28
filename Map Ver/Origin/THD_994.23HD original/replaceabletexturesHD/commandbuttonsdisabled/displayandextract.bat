@echo off
setlocal enabledelayedexpansion
for /d %%x in (*) do (
    if not "%%x" == "all" (
    	for /f "delims=" %%y in ('dir /b "%%x"') do (
		echo replaceabletextures\\commandbuttons\\%%y
		xcopy "%%x\%%y" "all\" > nul
    	)
    )
)
pause
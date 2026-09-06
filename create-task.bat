@echo off
REM Registers the HOURLY task -> run-hourly.cmd (was wrongly pointing at run-daily.cmd).
schtasks /create /tn "Job Scraper Hourly" /tr "cmd.exe /c \"%~dp0run-hourly.cmd\"" /sc hourly /mo 1 /f
pause

@echo off
schtasks /create /tn "Job Scraper Hourly" /tr "cmd.exe /c \"C:\Users\L4T\Documents\Job_Applications\job-scraper\job-scraper-main\run-daily.cmd\"" /sc hourly /mo 1 /f
pause
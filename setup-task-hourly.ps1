$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"C:\Users\L4T\Documents\Job_Applications\job-scraper\job-scraper-main\run-daily.cmd`""
$trigger = New-ScheduledTaskTrigger -Once -At "09:00AM" -RepetitionInterval (New-TimeSpan -Hours 1) -RepetitionDuration (New-TimeSpan -Days 9999)
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleEnd -AllowStartIfOnBatteries
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Highest
Register-ScheduledTask -TaskName "Job Scraper Hourly Alert" -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Force
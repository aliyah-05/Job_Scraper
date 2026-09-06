# Hourly OnlineJobs.PH sweep. Points at run-hourly.cmd (previously ran the daily sweep every hour).
$cmd = Join-Path $PSScriptRoot 'run-hourly.cmd'
$action    = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"$cmd`""
$trigger   = New-ScheduledTaskTrigger -Once -At "09:00AM" -RepetitionInterval (New-TimeSpan -Hours 1) -RepetitionDuration (New-TimeSpan -Days 9999)
$settings  = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleEnd -AllowStartIfOnBatteries
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Highest
Register-ScheduledTask -TaskName "Job Scraper Hourly Alert" -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Force

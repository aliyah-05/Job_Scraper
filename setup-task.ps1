# Daily full sweep at 09:00.
$cmd = Join-Path $PSScriptRoot 'run-daily.cmd'
$action    = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"$cmd`""
$trigger   = New-ScheduledTaskTrigger -Daily -At "09:00AM"
$settings  = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleEnd -AllowStartIfOnBatteries
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Highest
Register-ScheduledTask -TaskName "Job Scraper Daily Alert" -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Force

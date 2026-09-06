@echo off
REM Full sweep across all sources + Telegram digest heartbeat.
REM Path-independent: %~dp0 is this script's own folder, so the repo can live anywhere.
cd /d "%~dp0"
set "NODE=C:\Program Files\nodejs\node.exe"
if not exist "%NODE%" set "NODE=node"
"%NODE%" "%~dp0src\cli.mjs" --all --digest

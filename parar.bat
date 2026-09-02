@echo off
echo Parando containers...
docker compose down
if %errorlevel% neq 0 (
    "%LOCALAPPDATA%\Programs\DockerDesktop\resources\bin\docker.exe" compose down
)
echo Containers finalizados.
pause

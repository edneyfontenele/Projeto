@echo off
echo =======================================================
echo Iniciando MySQL, phpMyAdmin e Servidor Spring Boot...
echo =======================================================
docker compose up -d
if %errorlevel% neq 0 (
    echo.
    echo Tentando com caminho direto do Docker Desktop...
    "%LOCALAPPDATA%\Programs\DockerDesktop\resources\bin\docker.exe" compose up -d
)
echo.
echo =======================================================
echo [OK] Containers iniciados com sucesso!
echo.
echo  * Aplicacao Spring Boot: http://localhost:8082
echo  * phpMyAdmin (Banco):     http://localhost:8081
echo  * Porta MySQL:           localhost:3306
echo.
echo Para abrir o sistema no navegador, acesse:
echo http://localhost:8082
echo =======================================================
pause

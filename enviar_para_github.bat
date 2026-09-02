@echo off
chcp 65001 >nul
echo ====================================================================
echo       ENVIAR PROJETO PARA O GITHUB (edneyfontenele/Projeto)
echo ====================================================================
echo.
echo Para enviar os arquivos para o seu repositorio no GitHub com seguranca,
echo precisamos de um Personal Access Token (PAT) do GitHub.
echo.
echo Caso ainda nao tenha um Token:
echo 1. Acesse: https://github.com/settings/tokens
echo 2. Clique em "Generate new token (classic)"
echo 3. Marque a opcao "repo" e clique em "Generate token"
echo 4. Copie o token gerado (comeca com ghp_...)
echo.
set /p TOKEN="Cole aqui o seu Token do GitHub (PAT): "

if "%TOKEN%"=="" (
    echo.
    echo [ERRO] Token nao informado. Operacao cancelada.
    pause
    exit /b
)

echo.
echo Enviando arquivos para https://github.com/edneyfontenele/Projeto.git ...
docker run --rm --entrypoint /bin/sh -v "%cd%:/workspace" -w /workspace alpine/git -c "git push https://edneyfontenele:%TOKEN%@github.com/edneyfontenele/Projeto.git main --force"

if %errorlevel% equ 0 (
    echo.
    echo ====================================================================
    echo [SUCESSO!] Todos os arquivos foram enviados para o seu GitHub!
    echo Acesse: https://github.com/edneyfontenele/Projeto
    echo ====================================================================
) else (
    echo.
    echo [ATENCAO] Ocorreu um erro no envio. Verifique se o token tem permissao 'repo'.
)

echo.
pause

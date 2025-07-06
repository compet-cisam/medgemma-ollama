
@echo off
REM Verifica se o modelo medgemma já existe
ollama list | findstr medgemma > nul
IF %ERRORLEVEL% NEQ 0 (
    echo Criando o modelo medgemma...
    ollama create medgemma -f ./Modelfile
) ELSE (
    echo Modelo medgemma ja existe.
)

REM Sobe o Open WebUI diretamente com docker run
docker run -d -p 8080:8080 ^
 -v open-webui:/app/backend/data ^
 -e OLLAMA_BASE_URL=http://host.docker.internal:11434 ^
 --name open-webui ^
 --restart always ^
 ghcr.io/open-webui/open-webui:main

echo Open WebUI em http://localhost:8080
pause

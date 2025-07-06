#!/bin/bash

# Verifica se o modelo medgemma já existe
if ! ollama list | grep -q "medgemma"; then
    echo "Criando o modelo medgemma..."
    ollama create medgemma -f ./Modelfile
else
    echo "Modelo medgemma já existe."
fi

# Sobe o Open WebUI diretamente com docker run
docker run -d -p 8080:8080 \
 -v open-webui:/app/backend/data \
 -e OLLAMA_BASE_URL=http://127.0.0.1:11434 \
 --name open-webui \
 --restart always \
 ghcr.io/open-webui/open-webui:main

echo "Open WebUI disponível em http://localhost:8080"


# 🧠 Rodando o MedGemma Localmente com Ollama + Open WebUI

Este repositório contém o `Modelfile` necessário para executar o modelo **MedGemma** localmente usando o [Ollama](https://ollama.com/) e a interface web [Open WebUI](https://github.com/open-webui/open-webui).

---

## ⚙️ Requisitos

- ✅ [Ollama instalado](https://ollama.com/download)
- ✅ [Docker instalado](https://docs.docker.com/get-docker/)
- ✅ Espaço em disco (~10GB recomendado)

---

## 📥 1. Baixe o modelo `.gguf`

Baixe o modelo quantizado `medgemma-4b-it-Q8_0.gguf` do Hugging Face:

```bash
mkdir medgemma_build
cd medgemma_build

wget https://huggingface.co/kelkalot/medgemma-4b-it-GGUF/resolve/main/medgemma-4b-it-Q8_0.gguf
```

📁 Certifique-se de que o arquivo `.gguf` esteja na **mesma pasta que o `Modelfile`** e coloque no `Modelfile`** o nome do seu arquivo `.gguf`.

---

## 🧪 2. Crie o modelo no Ollama

Com o `Modelfile` e o `.gguf` na mesma pasta, execute:

```bash
ollama create medgemma -f ./Modelfile
```

✅ Isso registrará o modelo `medgemma` localmente no Ollama.

---

## 🧠 3. Rode o modelo com Ollama

```bash
ollama run medgemma
```

---

## 🌐 4. Execute o Open WebUI via Docker

Execute este comando para iniciar a interface web local:

```bash
docker run -d -p 8080:8080 \
  -v open-webui:/app/backend/data \
  -e OLLAMA_BASE_URL=http://host.docker.internal:11434 \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main
```

🔗 Depois, acesse:

```
http://localhost:8080
```

> 💡 Caso esteja no Linux, substitua `host.docker.internal` por `127.0.0.1`.

---

## ✅ Verificando

Você verá o modelo `medgemma` disponível no menu de modelos do Open WebUI. Basta selecioná-lo e começar a usar!

---

## 📌 Observações

- O arquivo `.gguf` **não está neste repositório** por questões de tamanho. Faça o download manual conforme mostrado acima.
- O modelo usa quantização `Q8_0`, ideal para resultados mais precisos (requer um pouco mais de RAM).
- O `Modelfile` já está configurado para rodar corretamente com o MedGemma.

---

## 📖 Créditos

- Modelo MedGemma convertido por: [`kelkalot`](https://huggingface.co/kelkalot/medgemma-4b-it-GGUF)
- Interface Web: [Open WebUI](https://github.com/open-webui/open-webui)
- Motor de execução local: [Ollama](https://ollama.com/)

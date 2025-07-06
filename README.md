
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

📁 Certifique-se de que o arquivo `.gguf` esteja na **mesma pasta que o `Modelfile`** e coloque no `Modelfile` o nome do seu arquivo `.gguf`.

---

## 🚀 2. Rodando tudo automaticamente com os scripts

Este repositório já contém scripts prontos para automatizar a criação do modelo e o deploy da interface web:

# ▶️ Windows
No terminal cmd ou PowerShell, execute:

```bash
setup-medgemma.bat
```

# 🐧 Linux/macOS
Dê permissão de execução:
```bash
chmod +x setup-medgemma.sh
```

Depois, execute:

```bash
./setup-medgemma.sh
```

Esse script:

✔️ Cria o modelo no Ollama (se ainda não existir)
✔️ Inicia o Open WebUI via Docker

## 🌐 3. Acesse a interface

```arduino
(http://localhost:8080)
```
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

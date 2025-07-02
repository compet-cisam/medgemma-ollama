import ollama
import base64
import time

def image_to_base64(file_path: str) -> str:
    with open(file_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode('utf-8')

if __name__ == "__main__":
    
    caminho_da_imagem = 'C:\Users\Educação\Downloads\MedGemma + Ollama + OpenWeb - Localmente\dedãoquebrado.png'
    prompt_usuario = "Descreva este raio-x em detalhes, focando em possíveis anomalias no pé do paciente."
    
    print("Iniciando pipeline multimodal com LLaVA...")
    start_time = time.time()
    
    try:
        imagem_base64 = image_to_base64(caminho_da_imagem)
        
        response = ollama.chat(
            model='llava',
            messages=[
                {
                    'role': 'user',
                    'content': prompt_usuario,
                    'images': [imagem_base64]
                }
            ]
        )
        
        print("\n--- Resposta do LLaVA ---")
        print(response['message']['content'])
        
    except Exception as e:
        print(f"\nOcorreu um erro: {e}")
        
    finally:
        end_time = time.time()
        print("\n" + "-" * 50)
        print(f"Pipeline concluída em {end_time - start_time:.2f} segundos.")

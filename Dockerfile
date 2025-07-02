# Define a imagem base, usando Python 3.9 slim para uma imagem menor
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requisitos para o diretório de trabalho
COPY requirements.txt . 

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o contêiner
COPY . .

# Expõe a porta 8000 para o mundo exterior
EXPOSE 8000

# Define o comando para iniciar a aplicação usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

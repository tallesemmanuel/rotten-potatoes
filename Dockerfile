### Imagem base utilizada.
FROM python:3.8-slim-buster

### Descrição do autor.
LABEL Author="Talles Alencar" Email="tallesemmanuelspfc@gmail.com" 

### Diretório padrão de trabalho dentro do container.
WORKDIR /app

### Copiando arquivos para serem instalados.
COPY src/requirements.txt .

### Instalando pacotes e dependências.
RUN pip install -r /app/requirements.txt

### Copiando projeto.
COPY src/ /app

### Expondo porta 5000.
EXPOSE 5000

### Principal processo de execução do container.
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:5000", "-c", "config.py", "app:app"]
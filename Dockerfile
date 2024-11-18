FROM selenium/standalone-chrome:latest

# Instalar Python y herramientas necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Instalar dependencias de Python
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copiar código de la aplicación
COPY . /app
WORKDIR /app

# Exponer el puerto que utilizará Uvicorn
EXPOSE 8080

# Comando para iniciar FastAPI con Uvicorn
CMD exec uvicorn --port $PORT --host 0.0.0.0 app:app
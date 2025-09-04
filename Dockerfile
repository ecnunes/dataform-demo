# Usamos a imagem oficial do Node.js como base
FROM node:16-slim

# Instalamos as dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Instalamos o Google Cloud SDK
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

# Instalamos o DataForm CLI globalmente
RUN npm install -g @dataform/cli

# Configuramos o diretório de trabalho
WORKDIR /dataform

# Copiamos os arquivos do projeto para o contêiner
COPY . .

# Comando padrão a ser executado quando o contêiner iniciar
CMD ["dataform", "help"]

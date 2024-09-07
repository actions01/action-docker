# Use uma imagem base do Linux. Aqui, usamos o Debian por ser uma escolha popular.
FROM debian:latest

# Instale as dependências necessárias
RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*

# Copie o script shell para o container
COPY main.sh /main.sh

# Torne o script executável
RUN chmod +x /main.sh

# Defina o script como ponto de entrada
ENTRYPOINT ["/main.sh"]
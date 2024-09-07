#!/bin/bash

# Obtenha os inputs da action
GITHUB_TOKEN=$1
ISSUE_ID=$2
COMMENT=$3
GITHUB_REPOSITORY=$4

# Inicialize o cliente do GitHub
response=$(curl -s -X POST -H "Authorization: token ${GITHUB_TOKEN}" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/${ISSUE_ID}/comments \
    -d "{\"body\": \"${COMMENT}\"}")

# Obtenha o ID do comentário criado
comment_id=$(echo $response | jq -r .id)

# Define o output com o ID do comentário
echo "comment-id=${comment_id}" >> $GITHUB_OUTPUT

echo "Comentário adicionado com sucesso! ID do comentário: $comment_id"

 

Arquivo Dockerfile

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
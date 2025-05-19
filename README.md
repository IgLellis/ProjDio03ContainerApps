# ProjDio03ContainerApps
Este projeto apresenta a construção e o deploy de uma aplicação web estática (um blog) utilizando Docker e Azure Container Apps, com gerenciamento de imagens via Azure Container Registry (ACR).

# 📦 Visão Geral
A aplicação consiste em uma imagem Docker baseada no Nginx Alpine, onde os arquivos estáticos de um blog HTML são servidos diretamente.
O fluxo completo de deploy passa por:
- Construção de imagem Docker local
- Execução local em container
- Criação de infraestrutura no Azure via CLI
- Push da imagem para o Azure Container Registry (ACR)
- Deploy final usando Azure Container Apps

# 🛠️ Tecnologias Utilizadas
- Docker
- Nginx
- Azure CLI
- ACR
- Azure Container Apps

# ⚠️ Desafios Enfrentados
Autenticação com ACR: compreender a necessidade de fornecer usuário e senha ao registrar a imagem no Container App.
Configuração da CLI Azure: entender a ordem correta dos comandos para evitar erros de dependência entre recursos.
  

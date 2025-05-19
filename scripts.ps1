docker build -t myapp:latest .
docker run -d -p 8080:80 myapp:latest

az login

az group create --name containerappslab03 --location eastus

az acr create --name containerappslab03acr --resource-group containerappslab03 --sku Basic --admin-enabled true

docker tag myapp:latest containerappslab03acr.azurecr.io/myapp:latest

docker push containerappslab03acr.azurecr.io/myapp:latest

az acr login --name containerappslab03acr

#create the container app
az containerapp env create --name containerappslab03env --resource-group containerappslab03 --location eastus
az containerapp create --name myapp --resource-group containerappslab03 --environment containerappslab03env --image containerappslab03acr.azurecr.io/myapp:latest \ `
--target-port 80 \ `
--ingress external `
--cpu 0.5 \ `
--memory 1.0Gi \ `
--registry-server-url containerappslab03acr.azurecr.io \ `
--registry-server-user $(az acr credential show --name containerappslab03acr --query "username" -o tsv) \ `
--registry-server-password $(az acr credential show --name containerappslab03acr --query "passwords[0].value" -o tsv) \ `
--min-replicas 1 \ `
--max-replicas 3 \ `
--revision-suffix v1 



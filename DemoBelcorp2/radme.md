# Docker build
En la carpeta raiz del projecto, en donde se encuentra el archivo ```.sln``` ejecutar
```
docker build -f .\DemoBelcorp2\Dockerfile -t webapi .
```
# prueba docker local test v35
```
docker run --name webapi -p 80:80 webapi
```

# ingresar al pawershell del contenedor
```
aws ecs execute-command --region us-east-2 --cluster alicorp-0000-demo-dev-cluster-for-dbt --task <TASK_ID> --container alicorp-0000-demo-dev-task-definition-for-dbt-container --interactive --command powershell.exe
```
docker container run -d `
    --name message-queue `
    dockeronwindows/ch05-nats:2e;

docker container run -d -p 1433:1433 `
  --name nerd-dinner-db `
  -v D:\databases\nd:C:\data `
  dockeronwindows/ch03-nerd-dinner-db:2e;

docker container run -d `
  --name nerd-dinner-save-handler `
  dockeronwindows/ch05-nerd-dinner-save-handler:2e;

docker container run -d -p 80 -p 8080 `
  --name reverse-proxy `
 -v \\.\pipe\docker_engine:\\.\pipe\docker_engine `
 tankh1/traefik:v1.7.8-win2004 `
 --api --docker --docker.endpoint=npipe:////./pipe/docker_engine --logLevel=DEBUG

docker container run -d `
 --name nerd-dinner-homepage `
 -l "traefik.frontend.rule=Host:nerddinner.local;Path:/,/css/site.css" `
 -l "traefik.frontend.priority=10" `
 dockeronwindows/ch03-nerd-dinner-homepage:2e;

docker container run -d `
 --name nerd-dinner-web `
 --env-file api-keys.env `
 -l "traefik.frontend.rule=Host:nerddinner.local;PathPrefix:/" `
 -l "traefik.frontend.priority=1" `
 -e "HomePage:Enabled=false" `
 -e "DinnerApi:Enabled=true" `
 dockeronwindows/ch05-nerd-dinner-web:2e;

docker container run -d `
 --name nerd-dinner-api `
 -l "traefik.frontend.rule=Host:api.nerddinner.local" `
 dockeronwindows/ch05-nerd-dinner-api:2e;

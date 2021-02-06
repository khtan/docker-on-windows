# Windows traefik version does not run:
# full invocation string: docker container run -d -p 80:80 -p 8080:8080 --name reverse-proxy -v \\.\pipe\docker_engine:\\.\pipe\docker_engine sixeyed/traefik:v1.7.8-windowsservercore-ltsc2019 --api --docker --docker.endpoint=npipe:////./pipe/docker_engine --logLevel=DEBUG
# arguments to docker: -d -p 80:80 -p 8080:8080 --name reverse-proxy -v \\.\pipe\docker_engine:\\.\pipe\docker_engine
# image to run: sixeyed/traefik:v1.7.8-windowsservercore-ltsc2019
# arguments to traefik: --api --docker --docker.endpoint=npipe:////./pipe/docker_engine --logLevel=DEBUG
# Linux:
# docker container run -d -p 80:80 -p 8080:8080 --name reverse-proxy -v /var/run/docker.sock:/var/run/docker.sock traefik:v1.7.8 --api --docker ???--docker.endpoint=npipe:////./pipe/docker_engine --logLevel=DEBUG
# --network nd-net
# --api # enable api/dashboard
# ---docker?
# --docker.endpoint?

docker container run -d -p 80 -p 8080 --name reverse-proxy -v /var/run/docker.sock:/var/run/docker.sock traefik:v1.7.8

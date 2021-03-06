 docker container run -d -p 9200 -p 9300 `
 --name elasticsearch `
 --env ES_JAVA_OPTS='-Xms512m -Xmx512m' `
 sixeyed/elasticsearch:5.6.11-windowsservercore-ltsc2019;

docker container run -d -p 5601 `
 --name kibana `
 -l "traefik.frontend.rule=Host:kibana.nerddinner.local" `
 sixeyed/kibana:5.6.11-windowsservercore-ltsc2019;

docker container run -d `
 --name nerd-dinner-index-handler `
 dockeronwindows/ch05-nerd-dinner-index-handler:2e;

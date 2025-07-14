FROM docker:dind

WORKDIR /opt

ADD ./docker-compose.yml docker-compose.yml

ENTRYPOINT ["docker", "compose", "up"]
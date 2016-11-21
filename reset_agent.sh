#!/bin/sh

DOCKER_CMD=$(docker inspect -f "{{.Config.Cmd}}" rancher-agent-bootstrap | sed 's/[\[{}]//g' | sed 's/\]//g')
AGENT_IMAGE=$(docker inspect -f "{{.Config.Image}}" rancher-agent-bootstrap)
# https://www.ipify.org/
HOST_IP=$(curl -s https://api.ipify.org)

docker run -d -e CATTLE_AGENT_IP=$HOST_IP \
    --privileged \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $AGENT_IMAGE \
    $DOCKER_CMD

#!/bin/bash

echo remove exited containers:
docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v

echo remove unused images:
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi

echo remove unused volumes:
docker volume ls -qf dangling=true | xargs -r docker volume rm

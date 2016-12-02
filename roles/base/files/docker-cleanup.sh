#!/bin/bash
docker ps --filter status=dead --filter status=exited --filter status="created" -aq | xargs -r docker rm -v
docker images --no-trunc -qf dangling=true | xargs -r docker rmi
docker volume ls -qf dangling=true | xargs -r docker volume rm
docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm docker-cleanup:0.1.1
